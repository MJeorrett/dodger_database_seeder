require('minitest/autorun')
require('minitest/rg')

require_relative('../database')

class DatabaseTest < MiniTest::Test

  def test_type_casting_integer()
    assert_equal( :int, Database.sql_to_simple_type( 'integer' ) )
  end

  def test_type_casting_bigint()
    assert_equal( :int, Database.sql_to_simple_type( 'bigint' ) )
  end

  def test_type_casting_smallint()
    assert_equal( :int, Database.sql_to_simple_type( 'smallint' ) )
  end

  def test_type_casting_numeric()
    assert_equal( :float, Database.sql_to_simple_type( 'numeric' ) )
  end

  def test_type_casting_character_varying()
    assert_equal( :string, Database.sql_to_simple_type( 'character varying' ) )
  end

  def test_type_casting_boolean()
    assert_equal( :bool, Database.sql_to_simple_type( 'boolean' ) )
  end

end
