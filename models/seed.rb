require_relative('../db/sql_interface')

class Seed

  DB_NAME = 'dodas'
  TABLE_NAME = 'seeds'

  def self.all_for_table_in_database( table_name, db_name )

    conditions = {
      target_table: table_name,
      target_database: db_name
    }
    seeds_data = SqlInterface.all_where( DB_NAME, TABLE_NAME, conditions )
    return seeds_data
  end

end
