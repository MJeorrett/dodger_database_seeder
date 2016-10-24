require_relative('../db/sql_interface')
require_relative('./model_builder')
require_relative('./html_element')

class Seed

  DB_NAME = 'dodas'
  TABLE_NAME = 'seeds'

  attr_reader :id, :name, :target_database, :target_table

  def initialize( data )

    id = data['id']
    @id = id.to_i if id != nil
    @name = data['name']
    @target_database = data['target_database']
    @target_table = data['target_table']

    if @id != nil
      @settings = Seed.all_for_seed_id( @id )
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

end
