require_relative('../db/sql_interface')

class Seed

  DB_NAME = 'dodas'

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
    data = {
      name: @name,
      db_name: @db_name,
      table_name: @table_name
    }
    id = SqlInterface.insert( DB_NAME, 'seeds', data )
    @id = id
  end

end
