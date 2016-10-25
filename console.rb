require('pry-byebug')
require_relative('./models/database')

pp Database.columns_for_table( 'dodas_test', 'types' )
