require_relative('../db/sql_interface')

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

  def self.all_for_table_in_database( table_name, db_name )

    conditions = {
      target_table: table_name,
      target_database: db_name
    }
    seeds_data = SqlInterface.all_where( DB_NAME, TABLE_NAME, conditions )
    return seeds_data
  end

end
