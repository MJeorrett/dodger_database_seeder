require('minitest/autorun')
require('minitest/rg')

require_relative('../hash__to_titles')

class HashToTitlesTest < MiniTest::Test

  def setup()
    @test_hash = {
      symbol: 1,
      camel_symbol: 1,
      'string' => 1,
      'camel_symbol' => 1
    }
  end

  def test_all()
    actual = @test_hash.to_titles()
    expected = {
      symbol: "Symbol",
      camel_symbol: "Camel Symbol",
      'string' => "String",
      'camel_symbol' => "Camel Symbol"
    }
    assert_equal( expected, actual )
  end

end
