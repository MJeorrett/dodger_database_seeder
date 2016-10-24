class DataFile

  def self.all_names()
    file_names = Dir[ENV['HOME'] + "/data/*"]
    binding.pry
    return file_names
  end

end
