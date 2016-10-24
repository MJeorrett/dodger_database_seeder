require_relative('html_element')

class HtmlSelect < HtmlElement

  def initialize( options, name )
    contents = options.map do |option|
      HtmlElement.new( 'option', option, { value: option } )
    end
    super( 'select', contents, { name: name } )
  end

end
