require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/databases_controller')
require_relative('controllers/seeds_controller')

NO_DATA_MESSAGE = "<p class='no-data'>-- No data --</p>"
