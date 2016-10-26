require('sinatra')
require('sinatra/contrib/all')

require_relative('../db/sql_interface')

# INDEX
get '/databases/:db_name/tables/:table_name/data' do
  @db_name = params[:db_name]
  @table_name = params[:table_name]
  @table_data = SqlInterface.all_records( @db_name, @table_name )

  erb(:'data/index')
end

# NEW
get '/databases/:db_name/tables/:table_name/data/new' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:db_name/tables/:table_name/data/new' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# CREATE
post '/databases/:db_name/tables/:table_name/data' do
  "Error 600: Matthew laziness error<br /><br />POST '/databases/:db_name/tables/:table_name/data' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# SHOW
get '/databases/:db_name/tables/:table_name/data/:row_id' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:db_name/tables/:table_name/data/:row_id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# EDIT
get '/databases/:db_name/tables/:table_name/data/:row_id/edit' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:db_name/tables/:table_name/data/:row_id/edit' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# UPDATE
put '/databases/:db_name/tables/:table_name/data/:row_id' do
  "Error 600: Matthew laziness error<br /><br />PUT '/databases/:db_name/tables/:table_name/data/:row_id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# DESTROY
delete '/databases/:db_name/tables/:table_name/data/:row_id' do
  "Error 600: Matthew laziness error<br /><br />DELETE '/databases/:db_name/tables/:table_name/data/:row_id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end
