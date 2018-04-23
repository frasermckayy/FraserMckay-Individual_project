# require( 'sinatra' )
# require( 'sinatra/contrib/all' )
# require_relative('../models/album.rb')
# require_relative('../models/artist.rb')
#
# 
# get '/albums' do
#   @albums = Album.all()
#   erb(:"albums/index")
# end
#
# get '/albums/:id' do
#   @album = Album.find(params['id'].to_i)
#   erb(:"albums/inventory")
# end
#
# get'/albums/:name' do
#   @album = Album.find(params['name'])
#   erb(:"albums/")
# end
#
# get '/albums/:quantity' do
#   @album = Album.find(params['quantity'].to_i)
#   erb(:"albums/inventory")
# end
#
#
# get '/artists' do
#   @artists = Artist.all()
#   erb (:"artists/index")
# end
#
# get '/artists/:id' do
#   @artists = Artist.find(params['id'].to_i)
#   erb(:"artists/inventory")
# end
