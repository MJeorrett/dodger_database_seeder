require('pry-byebug')

class HtmlElement

  attr_reader :tag

  def initialize( tag, contents="", attributes=[] )

    @tag = tag

    if !['String', 'HtmlElement', 'Array'].include?( contents.class.to_s)
      raise( TypeError, "type #{@contents.class} not supported")
    end

    @contents = contents
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

    case @contents.class.to_s
    when 'String'
      lines = [opening_tag() + @contents + closing_tag()]

    when 'HtmlElement'
      lines = [self.opening_tag]
      @contents.get_lines.each do |contents_line|
        lines << "  " + contents_line
      end
      lines << self.closing_tag

    when 'Array'
      lines = [self.opening_tag]
      @contents.each do |element|
        element.get_lines.each do |element_line|
          lines << "  " + element_line
        end
      end
      lines << self.closing_tag
    end
    
  end

end
