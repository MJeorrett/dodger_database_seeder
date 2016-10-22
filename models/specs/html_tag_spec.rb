require('minitest/autorun')
require('minitest/rg')

class HtmlTagTest < MiniTest::Test

  def test_simple_attributes_string_contents
    a_tag_attributes = {
      id: 'this_link',
      class: 'important',
      href: 'www.html.com'
    }
    @a_tag = HtmlTag.new('p', a_tag_attributes, "Click me!" )
    expected = "<a id='this_link' class='important' href='www.html.com'>Click me!</a>"
    assert_equal( expected, @a_tag.get_html )
  end

end
