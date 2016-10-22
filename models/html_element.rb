require('pry-byebug')

class HtmlElement

  def initialize( tag, contents="", attributes=[] )
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

    html += ">"

    case @contents.class.to_s
    when 'String'
      html += "#{@contents}"
    when 'HtmlElement'
      html += "\n  #{@contents}\n"
    else
      raise( TypeError, "type #{@contents.class} not supported")
    end

    html += "</#{@tag}>"

    return html
  end

end
