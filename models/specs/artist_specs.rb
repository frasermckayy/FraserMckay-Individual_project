require( 'minitest/autorun')
require('minitest/rg')

require_relative('../artist.rb')
require_relative('../album.rb')

class TestArtist < MiniTest::Test


  def setup()
    @artist = Artist.new("Logic")
    @album = Album.new("Flexicution")
  end

  def test_artist



end
