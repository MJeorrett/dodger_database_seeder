require_relative('../models/database')
require_relative('../models/html_table')

# INDEX
get '/databases' do
  names_data = Database.all_names()
  @table_html = HtmlTable.generate_table( names_data )
  erb(:'databases/index')
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
  @db_name = params[:dbname]
  tables_data = Database.tables_for_database( @db_name )
  @tables_html = HtmlTable.generate_table( tables_data )
  erb(:'databases/show')
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
