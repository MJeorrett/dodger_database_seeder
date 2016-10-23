require_relative('../db/sql_interface')
require_relative('./model_builder')

class Seed

  DB_NAME = 'dodas'
  TABLE_NAME = 'seeds'

  attr_reader :id, :name, :db_name, :table_name, :settings

  def initialize( data )

    id = data['id'].to_i
    @id = id if id != nil
    @name = data['name']
    @db_name = data['db_name']
    @table_name = data['table_name']

    settings_data = SqlInterface.all_where( DB_NAME, TABLE_NAME, { id: @id } )
    @settings = ModelBuilder( SeedSetting, settings_data )
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
