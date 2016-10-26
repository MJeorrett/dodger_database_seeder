require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/databases_controller')
require_relative('controllers/tables_controller')
require_relative('controllers/seeds_controller')
require_relative('controllers/data_controller')
require_relative('support/hash__to_titles')

get '/' do
  erb(:home)
end
