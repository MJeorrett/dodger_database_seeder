require_relative('../app')
require_relative('../models/database')
require_relative('../models/seed')
require_relative('../models/seed_setting')
require_relative('../models/html_table')
require_relative('../models/html_element')

# INDEX
get '/databases/:dbname/:table_name/seeds' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  seeds_data = Seed.all_for_table_in_database( params[:table_name], params[:dbname] )

  if seeds_data.empty?
    @table_html = NO_DATA_MESSAGE
  else
    seeds_data.each do |seed_data|
      seed_settings = SeedSettings.all_for_seed_id( seed_data[:id] )
      seed_settings.each do |seed_seeting|
        target_column = seed_setting['target_column']
        source_file = seed_setting['source_file']
        seed_data[target_column] = source_file
      end
    end

    @table_html = HtmlTable.generate_table( seeds_data )
  end

  erb(:'seeds/index')
end

# NEW
get '/databases/:dbname/:table_name/seeds/new' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  column_names = Database.columns_for_table( @db_name, @table_name )
  table_data = []
  column_names.each do |column_name|

    column = column_name['column_name']

    label = HtmlElement.new( 'label', column, { for: column } )

    input_attributes = {
      id: column,
      type: 'text',
      name: column
    }
    input = HtmlElement.new( 'input', "", input_attributes )

    table_data.push( {
      'column_name' => label.to_s,
      'source_file' => input.to_s
    } )
  end

  @table_html = HtmlTable.generate_table( table_data )

  erb(:'seeds/new')
end

# CREATE
post '/databases/:dbname/:table_name/seeds' do
  "Error 600: Matthew laziness error<br /><br />POST '/databases/:dbname/:table_name/seeds' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# SHOW
get '/databases/:dbname/:table_name/seeds/:id' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname/:table_name/seeds/:id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
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
