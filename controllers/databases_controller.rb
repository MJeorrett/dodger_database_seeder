require_relative('../app')
require_relative('../models/database')
require_relative('../models/html_element')
require_relative('../models/html_table')

# INDEX
get '/databases' do
  names_data = Database.all_names()

  names_data.map! do |name_data|
    key = name_data.keys.first
    db_name = name_data[key]
    href = "/databases/#{db_name}"
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
  @db_name = params[:dbname]
  @table_data = Database.tables_for_database( @db_name )

  @table_data.map do |table_data_row|
    href = "/databases/#{@db_name}/#{table_data_row['table_name']}/seeds"
    seeds_link = HtmlElement.new( 'a', 'seeds', { href: href })
    table_data_row['seeds_link'] = seeds_link
  end

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
