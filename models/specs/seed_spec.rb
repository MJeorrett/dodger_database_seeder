require('minitest/autorun')
require('minitest/rg')

require_relative('../seed')

class SeedTest < MiniTest::Test

  def setup()
    data = {
      'id' => '14',
      'name' => "rock_albums",
      'db_name' => "music_library",
      'table_name' => "albums"
    }

    @test_seed_1 = Seed.new( data )
  end

  def test_id()
    actual = @test_seed_1.id
    assert_equal( 'Fixnum', actual.class.to_s )
    assert_equal( 14, actual )
  end

  def test_name()
    assert_equal( "rock_albums", @test_seed_1.name )
  end

  def test_target_database()
    assert_equal( "music_library", @test_seed_1.target_database )
  end

  def test_target_table()
    assert_equal( "albums", @test_seed_1.target_table )
  end

  def test_settings_is_array()
    assert_equal( 'Array', @test_seed_1.settings.class.to_s )
  end

end
