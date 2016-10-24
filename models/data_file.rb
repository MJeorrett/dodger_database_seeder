class DataFile

  def self.all_names()
    file_paths = Dir[ENV['HOME'] + "/data/*"]

    file_names = file_paths.map do |file_path|
      Pathname.new(file_path).basename()
    end

    return file_names
  end

end
