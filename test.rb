require 'soundcloud'
require 'awesome_print'

# create client object with app credentials
client = Soundcloud.new(:client_id => ENV['client_id'],
                        :client_secret => ENV['client_secret'],
                        :redirect_uri => '/')

# redirect user to authorize URL
# redirect_to client.authorize_url()

tracks = client.get('/tracks', :limit => 10, :q => 'pony viceroy remix')
# print each link

hold_hotness = []

tracks.each do |track|
  hold_hotness << client.get('/resolve', :url => "#{track.permalink_url}")
end

ap hold_hotness.last
