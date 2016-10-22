require('minitest/autorun')
require('minitest/rg')

require_relative('../html_element')

class HtmlElementTest < MiniTest::Test

  def setup()
    a_attributes = {
      id: 'this_link',
      class: 'important',
      href: 'www.html.com'
    }
    @a_element = HtmlElement.new('a', a_attributes, "Click me!" )

    option_attributes = {
      id: 'option_1',
      selected: :boolean
    }
    @option_element = HtmlElement.new( 'option', option_attributes, "Option 1")
  end

  def test_simple_attributes_string_contents()

    expected = "<a id='this_link' class='important' href='www.html.com'>Click me!</a>"
    assert_equal( expected, @a_element.to_s )
  end

  def test_boolean_attribute()

    expected = "<option id='option_1' selected>Option 1</option>"
    assert_equal( expected, option_element.to_s )
  end

  def test_single_nested_element()

  end

end
