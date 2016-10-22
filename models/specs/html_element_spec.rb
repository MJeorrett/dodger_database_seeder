require('minitest/autorun')
require('minitest/rg')

require_relative('../html_element')

class HtmlElementTest < MiniTest::Test

  def setup()

    # BASIC ELEMENTS
    @div_element = HtmlElement.new( 'div' )
    @h1_element = HtmlElement.new('h1', "This is a title")

    # <a> ELEMENT
    a_attributes = {
      id: 'this_link',
      class: 'important',
      href: 'www.html.com'
    }
    @a_element = HtmlElement.new('a', "Click me!", a_attributes )

    # <option> ELEMENT
    option_attributes = {
      id: 'option_1',
      selected: :boolean
    }
    @option_element = HtmlElement.new( 'option', "Option 1", option_attributes )

    # NESTED ELEMENTS
    @nested_element = HtmlElement.new( 'div', @a_element )

    nested_elements_arr = [ @h1_element, @a_element, @div_element ]
    @array_nested_element = HtmlElement.new( 'div', nested_elements_arr, { id: "i-am-nested" })
  end

  def test_empty_element_and_no_attributes()

    assert_equal( "<div></div>", @div_element.to_s )
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

  def test_single_nested_element()
    expected =
"<div>
  <a id='this_link' class='important' href='www.html.com'>Click me!</a>
</div>"
    assert_equal( expected, @nested_element.to_s )
  end

  def test_array_of_nested_elements()
    expected =
"<div id='i-am-nested'>
  <h1>This is a title</h1>
  <a id='this_link' class='important' href='www.html.com'>Click me!</a>
  <div></div>
</div>"
    assert_equal( expected, @array_nested_element.to_s )
  end

  def test_get_lines_single_element()
    expected = ["<a id='this_link' class='important' href='www.html.com'>Click me!</a>"]
    assert_equal( expected, @a_element.get_lines )
  end

end
