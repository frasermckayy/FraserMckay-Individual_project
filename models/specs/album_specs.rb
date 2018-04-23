require( 'minitest/autorun')
require('minitest/rg')

require_relative('../artist.rb')
require_relative('../album.rb')


class TestAlbum < MiniTest::Test


  def setup()
    @artist = Artist.new("Logic")
    @album = Album.new("Flexicution")
  end

def test_album_name()
  assert_equal("Flexicution", @album.name)
end

end
