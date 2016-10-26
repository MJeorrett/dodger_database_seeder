require('sinatra')
require('sinatra/contrib/all')

require_relative('../db/sql_interface')
require_relative('../models/row_form_generator')

# INDEX
get '/databases/:dbname/tables/:table_name/data' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  @table_data = SqlInterface.all_records( @db_name, @table_name )
    
  if !@table_data.empty? && @table_data.first['id'] != nil
    @table_data.map! do |row|
      form_action = "/databases/#{@db_name}/tables/#{@table_name}/data/#{row['id']}"
      form_atts = {
        action: form_action,
        method: 'post'
      }
      submit_button = HtmlElement.new( 'input', "", { class: 'table-delete', type: 'submit', value: "delete" } )
      hidden_input = HtmlElement.new( 'input', "", { type: 'hidden', name: '_method', value: 'delete'} )
      form = HtmlElement.new( 'form', [ submit_button, hidden_input ], form_atts )
      row['buttons'] = form.to_s
      row
    end
  end

  highlight_param = params[:highlight]
  @table_highlight_rows = highlight_param.split(',') if highlight_param != nil

  erb(:'data/index')
end

# NEW
get '/databases/:dbname/tables/:table_name/data/new' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  @table_data = SqlInterface.all_records( @db_name, @table_name )
  edit_row = RowFormGenerator.generate_new_for_table( @db_name, @table_name )
  @table_data.unshift( edit_row )

  erb(:'data/new')
end

# CREATE
post '/databases/:dbname/tables/:table_name/data' do
  @db_name = params[:dbname]
  @table_name = params[:table_name]
  columns_data = Database.columns_for_table( @db_name, @table_name )
  columns_data.reject! { |column_data| column_data['column_name'] == 'id' }

  record_data = {}

  columns_data.each do |column_data|
    column_name = column_data['column_name']
    record_data[column_name] = params[column_name]
  end

  SqlInterface.insert( @db_name, @table_name, record_data )

  redirect to("/databases/#{@db_name}/tables/#{@table_name}/data")
end

# SHOW
get '/databases/:dbname/tables/:table_name/data/:row_id' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname/tables/:table_name/data/:row_id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# EDIT
get '/databases/:dbname/tables/:table_name/data/:row_id/edit' do
  "Error 600: Matthew laziness error<br /><br />GET '/databases/:dbname/tables/:table_name/data/:row_id/edit' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# UPDATE
put '/databases/:dbname/tables/:table_name/data/:row_id' do
  "Error 600: Matthew laziness error<br /><br />PUT '/databases/:dbname/tables/:table_name/data/:row_id' not implemented yet ... :-(<br /><br /><hr><br />params passed: #{params}"
end

# DESTROY
delete '/databases/:dbname/tables/:table_name/data/:row_id' do
  db_name = params[:dbname]
  table_name = params[:table_name]
  id = params[:row_id]
  Database.delete_with_id( db_name, table_name, id )
  redirect to("/databases/#{db_name}/tables/#{table_name}/data")
end

# DESTROY ALL
delete '/databases/:dbname/tables/:table_name/data' do
  db_name = params[:dbname]
  table_name = params[:table_name]
  Database.delete_all_from_table( db_name, table_name )

  redirect to("/databases/#{db_name}/tables/#{table_name}/data")
end
