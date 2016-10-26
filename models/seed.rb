require_relative('../db/sql_interface')
require_relative('./model_builder')
require_relative('./html_element')
require_relative('./seed_setting')
require_relative('./float_generator')

class Seed

  DB_NAME = 'dodas'
  TABLE_NAME = 'seeds'

  BOOL_CHOICE_VALUES = {
    true => [true],
    false => [false],
    nil => [true, false]
  }

  attr_reader :id, :name, :target_database, :target_table

  def initialize( data )

    id = data['id']
    @id = id.to_i if id != nil
    @name = data['seed_name']
    @target_database = data['target_database']
    @target_table = data['target_table']

  end

  def settings()
    if @id.nil?
      settings = []
    else
      settings = SeedSetting.all_for_seed_id( @id )
    end
  end

  def run( count )
    seed_values = {}

    settings().each do |setting|
      values = self.values_for_setting( setting )
      seed_values[setting.target_column] = values
    end

    count.times do
      values_hash = {}

      for column_name, values in seed_values
        values_hash[column_name] = values.sample
      end

      SqlInterface.insert( @target_database, @target_table, values_hash )
    end

  end

  def values_for_setting( seed_setting )

    case seed_setting.target_data_type
    when :bool
      values = BOOL_CHOICE_VALUES[ seed_setting.bool_choice ]

    when :int
      values = (seed_setting.min..seed_setting.max).to_a

    when :float
      values = FloatGenerator.new( seed_setting.min, seed_setting.max )

    when :string
      values = DataFile.values_from_file( seed_setting.source_file )

    when :ref
      values = Database.referenced_values_for_column( @target_database, @target_table, seed_setting.target_column )

      raise "Can't seed #{@target_table} as there are no records in a table which is referenced" if values.nil?

    end

    return values
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

  def self.save( data, target_database, target_table, target_columns_data )
    values_hash = {
      'seed_name' => data['seed_name'],
      'target_database' => target_database,
      'target_table' => target_table
    }
    seed_id = SqlInterface.insert( DB_NAME, TABLE_NAME, values_hash )

    target_columns_data.each do |target_column_data|
      target_column = target_column_data['column_name']
      setting_data = {
        'seed_id' => seed_id,
        'target_column' => target_column,
        'source_file' => data['source_file_' + target_column],
        'min' => data['min_' + target_column],
        'max' => data['max_' + target_column],
        'min_date' => data['min_date_' + target_column],
        'max_date' => data['max_date_' + target_column],
        'bool_choice' => data['bool_' + target_column]
      }
      seed_setting = SeedSetting.new( setting_data )
      seed_setting.save()
    end
  end

  def self.find_by_id( id )
    seed_data = SqlInterface.find_by_id( DB_NAME, TABLE_NAME, id )
    seed = ModelBuilder.model_from_data( Seed, seed_data )
    return seed
  end

end
