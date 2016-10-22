require('minitest/autorun')
require('minitest/rg')

require_relative('../database')

class DatabaseTest < MiniTest::Test

  def setup()
    @record_shop = Database.new( 'record_shop' )
  end

  def test_has_name()
    assert_equal( 'record_shop', @record_shop.name )
  end

end
