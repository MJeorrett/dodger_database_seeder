require('minitest/autorun')
require('minitest/rg')

require_relative('../html_select')

class HtmlSelectTest < MiniTest::Test

  def setup()
    options = ['banana', 'apple', 'orange']
    @select_1 = HtmlSelect.new( options, 'fruit' )
  end

  def test_basic()
    expected =
"<select name='fruit'>
  <option value='banana'>banana</option>
  <option value='apple'>apple</option>
  <option value='orange'>orange</option>
</select>"
    assert_equal( expected, @select_1.to_s )
  end

end
