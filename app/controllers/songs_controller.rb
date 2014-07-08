class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

## adding text
  # def create
  #   @playlist = Playlist.find(params[:song][:playlist])
  #   @song = @playlist.songs.build(song_params)
  #   if @song.save
  #     redirect_to user_playlist_path(current_user, @playlist)
  #   end
  # end

## using soundcloud

  def create
    @track = params[:song][:track]
    @title = params[:song][:title] || @track.title
    @artist = params[:song][:artist] || @track.artist
    @url = params[:song][:url]

    if @song.save
      puts "created!"
    end
  end

  def search
    @song = Song.new
    puts params[:search]
    search_text = params[:search]
    @search_results = search_soundcloud(search_text)
    render :results
  end

  def show
    @song = Song.find(params[:id])
  end


  private

  def song_params
    params.require(:song).permit(:title, :artist, :url)
  end

  def search_soundcloud(query)
    puts "QUERY BELOW!!!!!!!!!!!:"
    puts query
    client = SoundCloud.new(:client_id => ENV['client_id'],
                        :client_secret => ENV['client_secret'],
                        :redirect_uri => '/')
    searched_tracks = client.get('/tracks', :q => query, limit: 10)
  end

end