require_relative('../db/sql_runner')

class Seed

  attr_reader :id, :name, :db_name, :table_name, :settings

  def initialize( data )
    id = data['id'].to_i
    @id = id if id != nil
    @name = data['name']
    @db_name = data['db_name']
    @table_name = data['table_name']

    seed_settings_sql = "SELECT * FROM seed_settings WHERE seed_id = #{@id}"
    @settings = SqlRunner.run( 'dodas', seed_settings_sql, true )
  end

  def save()
    sql = "INSERT INTO seeds(name, db_name, table_name) VALUES ('#{@name}', '#{@db_name}', '#{@table_name}') RETURNING ID"
    result = SqlRunner.run ( 'dodas', sql )
    @id = result.first['id'].to_i
  end

end
