require('minitest/autorun')
require('minitest/rg')

require_relative('../html_element')

class HtmlElementTest < MiniTest::Test

  def setup()

    @br_element = HtmlElement.new('br')
    @h1_element = HtmlElement.new('h1', "This is a title")

    a_attributes = {
      id: 'this_link',
      class: 'important',
      href: 'www.html.com'
    }
    @a_element = HtmlElement.new('a', "Click me!", a_attributes )

    option_attributes = {
      id: 'option_1',
      selected: :boolean
    }

    @option_element = HtmlElement.new( 'option', "Option 1", option_attributes )
  end

  def test_empty_element_and_no_attributes()
    assert_equal( "<br></br>", @br_element.to_s )
  end

  def test_no_attributes()

    expected = "<h1>This is a title</h1>"
    assert_equal( expected, @h1_element.to_s )
  end

  def test_simple_attributes_string_contents()

    expected = "<a id='this_link' class='important' href='www.html.com'>Click me!</a>"
    assert_equal( expected, @a_element.to_s )
  end

  def test_boolean_attribute()

    expected = "<option id='option_1' selected>Option 1</option>"
    assert_equal( expected, @option_element.to_s )
  end

end
