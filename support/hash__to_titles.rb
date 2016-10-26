class Hash

  def to_titles()

    titles = {}

    self.keys.each do |key|
      snake_removed = key.to_s.gsub(/_/, " ")
      words = snake_removed.split( " " )
      words.map! { |word| word.capitalize }
      title = words.join( " " )
      titles[key] = title
    end

    return titles
  end

end
