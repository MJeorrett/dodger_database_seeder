require_relative('../db/sql_interface')
require_relative('./model_builder')


class SeedSetting

  DB_NAME = 'dodas'
  TABLE_NAME = 'seed_settings'

  BOOL_CHOICES = {
    'true' => true,
    't' => true,
    'false' => false,
    'f' => false,
    'random' => nil
  }

  attr_reader :id, :seed_id, :target_column, :target_data_type, :source_file, :min, :max, :bool_choice

  def initialize( data )

    id = data['id']
    @id = id.to_i if id != nil
    @seed_id = data['seed_id'].to_i
    @target_column = data['target_column']

    seed = self.seed()
    @target_data_type = Database.datatype_for_column( seed.target_database, seed.target_table, @target_column )

    @source_file = data['source_file']

    raw_min = data['min']
    @min = raw_min.to_f
    @min = raw_min.to_i if @target_data_type == :int

    raw_max = data['max']
    @max = raw_max.to_f
    @max = raw_max.to_i if @target_data_type == :int

    @bool_choice = BOOL_CHOICES[ data['bool_choice'] ]
  end

  def save()

    values_hash = {
      seed_id: @seed_id,
      target_column: @target_column,
      source_file: @source_file,
      min: @min,
      max: @max,
      bool_choice: @bool_choice
    }
    id = SqlInterface.insert( DB_NAME, TABLE_NAME, values_hash )
    @id = id
  end

  def seed()
    Seed.find_by_id( @seed_id )
  end

  def to_s()

    case @target_data_type
    when :int, :float
      string = "#{@min} to #{@max}"

    when :string
      string = "~/data/#{@source_file}"

    when :bool
      if @bool_choice.nil?
        string = 'random'
      else
        string = @bool_choice.to_s
      end

    end

    return string
  end

  def self.all_for_seed_id( seed_id )
    settings_data = SqlInterface.all_where( DB_NAME, TABLE_NAME, { seed_id: seed_id } )
    settings_models = ModelBuilder.models_from_data( SeedSetting, settings_data )
    return settings_models
  end

  def self.find_by_id( id )
    setting_data = SqlInterface.find_by_id( DB_NAME, TABLE_NAME, id )
    setting = ModelBuilder.model_from_data( SeedSetting, setting_data )
    return setting
  end

end
