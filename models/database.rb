require('../db/sql_runner')

class Database

  attr_reader :name

  def initialize( name )
    @name = name
  end

  def all_names()
    sql = "SELECT datname FROM pg_database WHERE datistemplate = false"
    results = SqlRunner.run( sql, true )
    return results
  end

end
