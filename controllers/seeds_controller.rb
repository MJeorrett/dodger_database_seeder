require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/databases_controller')

# INDEX
get '/databases' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# NEW
get '/databases/new' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/new' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# CREATE
post '/databases' do
  "Error 600: Matthew laziness error<br /><br />POST '/databases' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# SHOW
get '/databases/:dbname' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# EDIT
get '/databases/:dbname/edit' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname/edit' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# UPDATE
put '/databases/:dbname' do
  "Error 600: Matthew laziness error<br /><br />PUT '/databases/:dbname' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# DESTROY
delete '/databases/:dbname' do
  "Error 600: Matthew laziness error<br /><br />DELETE '/databases/:dbname' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end
