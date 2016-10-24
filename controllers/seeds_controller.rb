require_relative('../app')
require_relative('../models/database')
require_relative('../models/seed')
require_relative('../models/seed_setting')
require_relative('../models/html_table')
require_relative('../models/html_element')
require_relative('../models/data_file')

enable(:sessions)

# INDEX
get '/databases/:dbname/:table_name/seeds' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  @seeds = Seed.all_for_table_in_database( params[:table_name], params[:dbname] )
  @no_data_message = NO_DATA_MESSAGE

  erb(:'seeds/index')
end

# NEW
get '/databases/:dbname/:table_name/seeds/new' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  @target_columns = Database.columns_for_table( @db_name, @table_name )
  @target_columns.delete( "id" )
  session[:target_columns] = @target_columns
  @seeds = Seed.all_for_table_in_database( @table_name, @db_name )
  @file_names = DataFile.all_names()

  erb(:'seeds/new')
end

# CREATE
post '/databases/:dbname/:table_name/seeds' do
  db_name = params[:dbname]
  table_name = params[:table_name]
  Seed.save( params, db_name, table_name, session[:target_columns] )
  redirect to( "/databases/#{db_name}/#{table_name}/seeds")
end

# SHOW
get '/databases/:dbname/:table_name/seeds/:id' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  @seed = Seed.find_by_id( params[:id] )

  erb( :'seeds/show')
end

# RUN
post '/databases/:dbname/:table_name/seeds/:id/run' do
  seed = Seed.find_by_id( params[:id] )
  seed.run( params[:number_of_runs].to_i )
  redirect to("/databases/#{params[:dbname]}/#{params[:table_name]}/seeds")
end

# EDIT
get '/databases/:dbname/:table_name/seeds/:id/edit' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname/:table_name/seeds/:id/edit' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# UPDATE
put '/databases/:dbname/:table_name/seeds/:id' do
  "Error 600: Matthew laziness error<br /><br />PUT '/databases/:dbname/:table_name/seeds/:id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# DESTROY
delete '/databases/:dbname/:table_name/seeds/:id' do
  "Error 600: Matthew laziness error<br /><br />DELETE '/databases/:dbname/:table_name/seeds/:id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end
