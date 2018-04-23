require( 'sinatra' )
require( 'sinatra/contrib/all')
require_relative('./controllers/controller.rb')


get '/' do
  erb(:index)
end

get '/inventory' do
  @artists = Artist.name()
  @albums = Album.name()
  erb(:inventory)
end

# get '/stock_level' do
#   @quantity = Quantity.all()
#   erb(:stock_level)
# end
