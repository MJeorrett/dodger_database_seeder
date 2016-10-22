require('minitest/autorun')
require('minitest/rg')

require_relative('../seed_setting')

class SeedSettingTest < MiniTest::Test

  def setup()
    data = {
      'id' => '3',
      'seed_id' => '5',
      'column_name' => 'title',
      'source_file' => 'rock_albums.txt'
    }

    @test_seed_setting_1 = SeedSetting.new( data )
  end

  def test_id()
    actual = @test_seed_setting_1.id
    assert_equal( 'Fixnum', actual.class.to_s )
    assert_equal( 3, actual )
  end

  def test_seed_id()
    actual = @test_seed_setting_1.seed_id
    assert_equal( 'Fixnum', actual.class.to_s )
    assert_equal( 5, actual )
  end

  def test_column_name()
    assert_equal( "title", @test_seed_setting_1.column_name )
  end

  def test_source_file()
    assert_equal( "rock_albums.txt", @test_seed_setting_1.source_file )
  end

end
