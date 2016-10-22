class SeedSetting

  attr_reader :id, :seed_id, :column_name, :source_file

  def initialize( data )
    id = data['id'].to_i
    @id = id if id != nil
    @seed_id = data['seed_id'].to_i
    @column_name = data['column_name']
    @source_file = data['source_file']
  end

  def save()
    sql = "INSERT INTO seed_settings(seed_id, column_name, source_file) VALUES (#{@seed_id}, '#{@column_name}', '#{@source_file}') RETURNING ID"
    result = SqlRunner.run ( 'dodas', sql )
    @id = result.first['id'].to_i
  end

end
