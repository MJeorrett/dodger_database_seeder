require_relative('../app')
require_relative('../models/database')
require_relative('../models/seed')
require_relative('../models/seed_setting')
require_relative('../models/html_element')
require_relative('../models/data_file')

enable(:sessions)

# INDEX
get '/databases/:dbname/tables/:table_name/seeds' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  @seeds = Seed.all_for_table_in_database( params[:table_name], params[:dbname] )

  erb(:'seeds/index')
end

# NEW
get '/databases/:dbname/tables/:table_name/seeds/new' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  @target_columns_data = Database.columns_for_table( @db_name, @table_name )

  @target_columns_data.reject! do |column_data|
    column_data['column_name'] == 'id'
  end

  session[:target_columns_data] = @target_columns_data
  @seeds = Seed.all_for_table_in_database( @table_name, @db_name )
  @file_names = DataFile.all_names()

  erb(:'seeds/new')
end

# CREATE
post '/databases/:dbname/tables/:table_name/seeds' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  Seed.save( params, @db_name, @table_name, session[:target_columns_data] )
  redirect to( "/databases/#{@db_name}/tables/#{@table_name}/seeds")
end

# SHOW
get '/databases/:dbname/tables/:table_name/seeds/:id' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  @seed = Seed.find_by_id( params[:id] )

  erb( :'seeds/show')
end

# RUN
get '/databases/:dbname/tables/:table_name/seeds/:id/run' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  @seed = Seed.find_by_id( params[:id] )

  erb( :'seeds/run')
end

# PROCESS RUN
post '/databases/:dbname/tables/:table_name/seeds/:id/run' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  seed = Seed.find_by_id( params[:id] )
  seed.run( params[:number_of_runs].to_i )
  redirect to("/databases/#{params[:dbname]}/tables/#{params[:table_name]}/data")
end

# EDIT
get '/databases/:dbname/tables/:table_name/seeds/:id/edit' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname/tables/:table_name/seeds/:id/edit' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# UPDATE
put '/databases/:dbname/tables/:table_name/seeds/:id' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  "Error 600: Matthew laziness error<br /><br />PUT '/databases/:dbname/tables/:table_name/seeds/:id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# DESTROY
delete '/databases/:dbname/tables/:table_name/seeds/:id' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  "Error 600: Matthew laziness error<br /><br />DELETE '/databases/:dbname/tables/:table_name/seeds/:id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end
