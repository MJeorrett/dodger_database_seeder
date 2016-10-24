require_relative('../db/sql_interface')
require_relative('./model_builder')


class SeedSetting

  DB_NAME = 'dodas'
  TABLE_NAME = 'seed_settings'

  attr_reader :id, :seed_id, :target_column, :source_file, :min, :max

  def initialize( data )

    id = data['id']
    @id = id.to_i if id != nil
    @seed_id = data['seed_id'].to_i
    @target_column = data['target_column']

    source_file_key = data.keys.find { |key| key.start_with?('source_file_') }
    @source_file = data[source_file_key] || data['source_file']

    min_key = data.keys.find { |key| key.start_with?('min_')}
    @min = ( data[min_key] || data['min'] ).to_i

    max_key = data.keys.find { |key| key.start_with?('max_')}
    @max = ( data[max_key] || data['max'] ).to_i
  end

  def save()
    values_hash = {
      seed_id: @seed_id,
      target_column: @target_column,
      source_file: @source_file,
      min: @min,
      max: @max
    }
    id = SqlInterface.insert( DB_NAME, TABLE_NAME, values_hash )
    @id = id
  end

  def to_s()
    if @source_file.nil?
      string = "number: #{@min} to #{@max}"
    else
      string = "file: #{@source_file}"
    end

    return string
  end

  def self.all_for_seed_id( seed_id )
    settings_data = SqlInterface.all_where( DB_NAME, TABLE_NAME, { seed_id: seed_id } )
    settings_models = ModelBuilder.models_from_data( SeedSetting, settings_data )
    return settings_models
  end

end
