require('minitest/autorun')
require('minitest/rg')

require_relative('../html_tag')

class HtmlTagTest < MiniTest::Test

  def test_simple_attributes_string_contents

    attributes = {
      id: 'this_link',
      class: 'important',
      href: 'www.html.com'
    }

    a_element = HtmlTag.new('a', attributes, "Click me!" )
    expected = "<a id='this_link' class='important' href='www.html.com'>Click me!</a>"

    assert_equal( expected, a_element.to_s )
  end

  def test_boolean_attribute
    attributes = {
      id: 'option_1',
      selected: :boolean
    }
    option_element = HtmlTag.new( 'option', attributes, "Option 1")
    expected = "<option id='option_1' selected>Option 1</option>"

    assert_equal( expected, option_element.to_s )
  end

end
