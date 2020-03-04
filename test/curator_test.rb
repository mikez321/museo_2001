require './lib/photograph'
require './lib/artist'
require './lib/curator'
require 'minitest/autorun'
require 'minitest/pride'

class CuratorTest < Minitest::Test
  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end
end
