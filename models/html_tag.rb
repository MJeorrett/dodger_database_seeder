class HtmlTag

  def initialize( tag, attributes, contents )
    @tag = tag
    @attributes = attributes
    @contents = contents
  end

  def to_s()
    html = "<#{@tag}"
    for attribute, value in @attributes

      if value == :boolean
        html += " #{attribute}"
      else
        html += " #{attribute}='#{value}'"
      end
      
    end
    html += ">#{@contents}</#{@tag}>"

    return html
  end

end
