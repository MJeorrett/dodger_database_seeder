require('sinatra')
require('sinatra/contrib/all')

# INDEX
get '/databases/:dbname/tables' do
  @db_name = params[:dbname]
  @table_data = Database.tables_for_database( @db_name )

  @table_data.map do |table_data_row|
    href = "/databases/#{@db_name}/#{table_data_row['table_name']}/seeds"
    seeds_link = HtmlElement.new( 'a', 'seeds', { href: href })
    table_data_row['seeds_link'] = seeds_link
  end

  erb(:'databases/show')
end

# NEW
get '/databases/:dbname/tables/new' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname/tables/new' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# CREATE
post '/databases/:dbname/tables' do
  "Error 600: Matthew laziness error<br /><br />POST '/databases/:dbname/tables' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# SHOW
get '/databases/:dbname/tables/:table_name' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname/tables/:table_name' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# EDIT
get '/databases/:dbname/tables/:table_name/edit' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname/tables/:table_name/edit' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# UPDATE
put '/databases/:dbname/tables/:table_name' do
  "Error 600: Matthew laziness error<br /><br />PUT '/databases/:dbname/tables/:table_name' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# DESTROY
delete '/databases/:dbname/tables/:table_name' do
  "Error 600: Matthew laziness error<br /><br />DELETE '/databases/:dbname/tables/:table_name' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end
