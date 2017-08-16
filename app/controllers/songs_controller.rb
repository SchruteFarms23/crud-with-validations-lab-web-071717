class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_param)

    if @song.valid?
    @song.save
    redirect_to song_path(@song)
    else
    render :new
    end
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_param)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def song_param
    params.require(:song).permit(:title,:artist_name,:genre,:released,:release_year)
  end

end
