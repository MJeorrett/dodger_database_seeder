require_relative('../db/sql_interface')
require_relative('./model_builder')
require_relative('./html_element')
require_relative('./seed_setting')

class Seed

  DB_NAME = 'dodas'
  TABLE_NAME = 'seeds'

  attr_reader :id, :name, :target_database, :target_table, :settings

  def initialize( data )

    id = data['id']
    @id = id.to_i if id != nil
    @name = data['seed_name']
    @target_database = data['target_database']
    @target_table = data['target_table']

    if @id != nil
      @settings = SeedSetting.all_for_seed_id( @id )
    end

  end

  def self.all_for_table_in_database( target_table, target_database )
    conditions = {
      target_table: target_table,
      target_database: target_database
    }

    seeds_data = SqlInterface.all_where( DB_NAME, TABLE_NAME, conditions )
    seeds_models = ModelBuilder.models_from_data( Seed, seeds_data )
    return seeds_models
  end

  def self.save( data, target_database, target_table, target_columns )
    values_hash = {
      'seed_name' => data['seed_name'],
      'target_database' => target_database,
      'target_table' => target_table
    }
    seed_id = SqlInterface.insert( DB_NAME, TABLE_NAME, values_hash )

    target_columns.each do |target_column|
      setting_data = {
        'seed_id' => seed_id,
        'target_column' => target_column,
        'source_file' => data[target_column]
      }
      seed_setting = SeedSetting.new( setting_data )
      seed_setting.save()
    end
  end

end
