require_relative('../db/sql_runner')

class Database

  SQL_TO_SIMPLE_TYPES = {
    'integer' => :int,
    'bigint' => :int,
    'smallint' => :int,
    'numeric' => :float,
    'character varying' => :string,
    'boolean' => :bool,
    'date' => :date
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
      results.map! do |result|
        reference_for_column = Database.reference_for_column( db_name, table_name, result['column_name'] )

        if reference_for_column != nil
          result['referenced_column'] = "#{reference_for_column['referenced_table']}.#{reference_for_column['referenced_column']}"
          simple_type = :ref
        else
          simple_type = self.sql_to_simple_type( result['data_type'] )
        end

        result['data_type'] = simple_type
        result
      end

      return results
  end

  def self.datatype_for_column( db_name, table_name, column_name )

    columns_data = self.columns_for_table( db_name, table_name )

    column_data = columns_data.find do |a_column_data|
      a_column_data['column_name'] == column_name
    end

    return column_data['data_type']
  end

  def self.reference_for_column( db_name, table_name, column_name )
    # query adapted from http://stackoverflow.com/questions/1152260/postgres-sql-to-list-table-foreign-keys
    sql =
"SELECT
  ccu.table_name AS referenced_table,
  ccu.column_name AS referenced_column
FROM
  information_schema.table_constraints AS tc
  JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
  JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
WHERE
  tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_name = '#{table_name}'
  AND kcu.column_name = '#{column_name}'"
    results = SqlRunner.run( db_name, sql, true )
    return results.first
  end

  def self.referenced_values_for_column( db_name, table_name, column_name )
    ref_data = self.reference_for_column( db_name, table_name, column_name)

    if ref_data.nil?
      results = nil
    else
      ref_table = ref_data['referenced_table']
      ref_column = ref_data['referenced_column']

      sql = "SELECT DISTINCT #{ref_column} FROM #{ref_table}"
      sql_result = SqlRunner.run( db_name, sql, true )
      results = sql_result.map { |result| result.values.first }
    end

    return results
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
