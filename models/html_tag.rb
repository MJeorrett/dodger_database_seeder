class HtmlTag

  def initialize( tag, attributes, contents )
    @tag = tag
    @attributes = attributes
    @contents = contents
  end

  def to_s()
    html = "<#{@tag}"
    for attribute, value in @attributes
      html += " #{attribute}='#{value}'"
    end
    html += ">#{@contents}</#{@tag}>"

    return html
  end

end
