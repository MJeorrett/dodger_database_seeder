require_relative('../db/sql_interface')
require_relative('./model_builder')


class SeedSetting

  DB_NAME = 'dodas'
  TABLE_NAME = 'seed_settings'

  attr_reader :id, :seed_id, :target_column, :source_file

  def initialize( data )
    id = data['id']
    @id = id.to_i if id != nil
    @seed_id = data['seed_id'].to_i
    @target_column = data['target_column']
    @source_file = data['source_file']
  end

  def self.all_for_seed_id( seed_id )
    settings_data = SqlInterface.all_where( DB_NAME, TABLE_NAME, { seed_id: seed_id } )
    settings_models = ModelBuilder.models_from_data( SeedSetting, settings_data )
    return settings_models
  end

end
