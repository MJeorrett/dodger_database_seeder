require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/databases_controller')
require_relative('controllers/seeds_controller')

NO_DATA_MESSAGE = "<h3 class='no-data'>-- No data --</h3>"
