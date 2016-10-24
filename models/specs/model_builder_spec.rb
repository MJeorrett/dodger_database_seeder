require('minitest/autorun')
require('minitest/rg')

require_relative('../model_builder')
require_relative('../seed_setting')

class ModelBuilderTest < MiniTest::Test

  def setup()
    @data_1 = {
      'id' => '3',
      'seed_id' => '5',
      'target_column' => 'title',
      'source_file' => 'rock_albums.txt'
    }
    @data_2 = {
      'id' => '4',
      'seed_id' => '12',
      'target_column' => 'artist',
      'source_file' => 'artists.txt'
    }
  end

  def test_many_models()

    many_data = [ @data_1, @data_2 ]
    many_models = ModelBuilder.models_from_data( SeedSetting, many_data )

    model_1 = many_models[0]
    assert_equal( 'SeedSetting', model_1.class.to_s )
    assert_equal( 3, model_1.id )
    assert_equal( 5, model_1.seed_id )
    assert_equal( 'title', model_1.target_column )
    assert_equal( 'rock_albums.txt', model_1.source_file )

    model_2 = many_models[1]
    assert_equal( 'SeedSetting', model_2.class.to_s )
    assert_equal( 4, model_2.id )
    assert_equal( 12, model_2.seed_id )
    assert_equal( 'artist', model_2.target_column )
    assert_equal( 'artists.txt', model_2.source_file )
  end

  def test_single_model()
    model_1 = ModelBuilder.model_from_data( SeedSetting, [ @data_1 ] )
    assert_equal( 'SeedSetting', model_1.class.to_s )
    assert_equal( 3, model_1.id )
    assert_equal( 5, model_1.seed_id )
    assert_equal( 'title', model_1.target_column )
    assert_equal( 'rock_albums.txt', model_1.source_file )
  end

end
