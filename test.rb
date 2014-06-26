require 'soundcloud'
require 'awesome_print'

# create client object with app credentials
client = Soundcloud.new(:client_id => 'af82df3718bc2926a6c6aae41e0de7f2',
                        :client_secret => 'eb54c6706ca20d73803873ce9e40e38a',
                        :redirect_uri => '/')

# redirect user to authorize URL
# redirect_to client.authorize_url()

tracks = client.get('/tracks', :limit => 10, :order => 'hotness')
# print each link

hold_hotness = []

tracks.each do |track|
  hold_hotness << client.get('/resolve', :url => "#{track.permalink_url}")
end

ap hold_hotness.last["id"]