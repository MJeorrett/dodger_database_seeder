require_relative('./seed')
require_relative('../db/sql_interface')

class SeedSetting

  attr_reader :id, :seed_id, :column_name, :source_file

  def initialize( data )
    id = data['id'].to_i
    @id = id if id != nil
    @seed_id = data['seed_id'].to_i
    @column_name = data['column_name']
    @source_file = data['source_file']
  end

  def save()
    data = {
      seed_id: @seed_id,
      column_name: @column_name,
      source_file: @source_file
    }
    id = SqlInterface.insert( Seed::DB_NAME, 'seed_settings', data )
    @id = id
  end

end
