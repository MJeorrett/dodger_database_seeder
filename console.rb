require('pry-byebug')
require_relative('./models/database')

pp Database.columns_for_table( 'dodas', 'seed_settings' )

puts

pp Database.datatype_for_column( 'dodas', 'seed_settings', 'seed_id' )
