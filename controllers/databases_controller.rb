require_relative('../app')
require_relative('../models/database')
require_relative('../models/html_element')

# INDEX
get '/databases' do
  names_data = Database.all_names()

  names_data.map! do |name_data|
    key = name_data.keys.first
    db_name = name_data[key]
    href = "/databases/#{db_name}/tables"
    {
      key => HtmlElement.new( 'a', db_name, { href: href } )
    }
  end

  @table_data = names_data

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
  "Error 600: Matthew laziness error<br /><br />POST '/databases/:dbname' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
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
