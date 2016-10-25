require_relative('../db/sql_runner')

class Database

  SQL_TO_SIMPLE_TYPES = {
    'integer' => :int,
    'bigint' => :int,
    'smallint' => :int,
    'numeric' => :float,
    'character varying' => :string,
    'boolean' => :bool
  }

  def self.tables_for_database( db_name )
    sql =
    "SELECT table_name FROM information_schema.tables
      WHERE table_type = 'BASE TABLE' AND
        table_schema NOT IN ('pg_catalog', 'information_schema')"
    results = SqlRunner.run( db_name, sql, true )
    return results
  end

  def self.columns_for_table( db_name, table_name )
    sql =
    "SELECT column_name, data_type
      FROM information_schema.columns
      WHERE table_name = '#{table_name}'"

      results = SqlRunner.run( db_name, sql, true )
      return results
  end

  def self.datatype_for_column( db_name, table_name, column_name )
    sql =
    "SELECT data_type
      FROM information_schema.columns
      WHERE table_name = '#{table_name}' AND
        column_name = '#{column_name}'"
    results = SqlRunner.run( db_name, sql, true )
    return results.first['data_type']
  end

  def self.all_names()
    sql = "SELECT datname FROM pg_database WHERE datistemplate = false"
    results = SqlRunner.run( 'user', sql, true )

    return results
  end

  def self.sql_to_simple_type( sql_type_string )
    simple_type = SQL_TO_SIMPLE_TYPES[sql_type_string]
    return simple_type
  end

end
