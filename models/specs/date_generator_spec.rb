require('minitest/autorun')
require('minitest/rg')

require_relative('../date_generator')

class DateGeneratorTest < MiniTest::Test

  def setup()
    @min_date = Date.parse("2016-10-01")
    @max_date = Date.parse("2016-10-31")
    @generator = DateGenerator.new( @min_date, @max_date )
  end

  def test_sample_returns_date()
    100.times do
      date = @generator.sample()
      assert_equal( 'Date', date.class.to_s )
    end
  end

  def test_smaple_returns_date_in_range()
    100.times do
      date = @generator.sample()
      assert( date >= @min_date )
      assert( date <= @max_date )
    end
  end

end
