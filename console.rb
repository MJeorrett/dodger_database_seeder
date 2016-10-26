require('pry-byebug')
require_relative('./models/database')
require('date')
require_relative('models/row_form_generator')

# pp Database.columns_for_table( 'dodas_test', 'test_table' )

pp RowFormGenerator.generate_new_for_table( 'dodas_test', 'test_table' )

binding.pry
nil
