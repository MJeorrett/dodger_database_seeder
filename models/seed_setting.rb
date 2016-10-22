class SeedSetting

  attr_reader :id, :seed_id, :column_name, :source_file

  def initialize( data )
    id = data['id'].to_i
    @id = id if id != nil
    @seed_id = data['seed_id'].to_i
    @column_name = data['column_name']
    @source_file = data['source_file']
  end

end
