require_relative('../db/sql_runner')

class Database

  def self.tables_for_database( db_name )
    sql =
    "SELECT table_name FROM information_schema.tables
      WHERE table_type = 'BASE TABLE' AND
        table_schema NOT IN ('pg_catalog', 'information_schema')"
    results = SqlRunner.run( db_name, sql, true )
    return results
  end

  def self.all_names()
    sql = "SELECT datname FROM pg_database WHERE datistemplate = false"
    results = SqlRunner.run( 'user', sql, true )

    return results
  end

end
