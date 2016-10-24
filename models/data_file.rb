class DataFile

  def self.all_names()
    file_paths = Dir[ENV['HOME'] + "/data/*"]

    file_names = file_paths.map do |file_path|
      Pathname.new(file_path).basename()
    end

    return file_names
  end

  def self.values_from_file( file_name )
    file_contents = File.read( ENV['HOME'] + "/data/" + file_name )
    values_array = file_contents.lines.map { |line| line.strip }
  end

end
