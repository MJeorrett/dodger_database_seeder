class HtmlElement

  def initialize( tag, contents, attributes=[] )
    @tag = tag
    @contents = contents
    @attributes = attributes
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
