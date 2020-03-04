require './lib/photograph'
require 'minitest/autorun'
require 'minitest/pride'

class ArtistTest < Minitest::Test

  def test_it_exists
    artist = Artist.new(attributes)
    assert_instance_of Artist, artist
  end
end
