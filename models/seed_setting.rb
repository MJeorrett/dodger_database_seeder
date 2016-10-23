require_relative('../db/sql_interface')

class SeedSetting

  DB_NAME = 'dodas'
  TABLE_NAME = 'seed_settings'

  def self.all_for_seed_id( seed_id )
    settings_data = SqlInterface.all_where( DB_NAME, TABLE_NAME, { seed_id: seed_id } )
    return settings_data
  end

end
