require('pry-byebug')

class HtmlElement

  attr_reader :tag

  def initialize( tag, contents="", attributes=[] )
    @tag = tag

    case contents.class.to_s
    when 'String'
      @contents = contents

    when 'HtmlElement'
      @contents = [ "  " + contents.to_s ]

    when 'Array'
      @contents = []
      contents.each do |element|
        element_lines = element.get_lines
        element_lines.each { |line| @contents.push( "  " + line ) }
      end

    else
      raise( TypeError, "type #{@contents.class} not supported")
    end

    @attributes = attributes
  end

  def to_s()

    return self.get_lines().join("\n")
  end

  def opening_tag()

    html = "<#{@tag}"

    for attribute, value in @attributes
      if value == :boolean
        html += " #{attribute}"
      else
        html += " #{attribute}='#{value}'"
      end
    end

    html += ">"

    return html
  end

  def closing_tag()
    return "</#{@tag}>"
  end

  def get_lines()

    if @contents.class.to_s == 'String'
      lines = [self.opening_tag + @contents + self.closing_tag]
    else
      lines = [self.opening_tag] + @contents + [self.closing_tag]
    end
  end

end
