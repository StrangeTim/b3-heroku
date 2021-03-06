class ArtistsController < ApplicationController
  def index
    @artists = Artist.order(:name)
  end

  def show
    @artist = Artist.find(params[:id])
    @artwork = Artwork.new
    @artworks = @artist.artworks
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artists_path
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end


  private
  def artist_params
    params.require(:artist).permit(:name, :bio, :profile_pic)
  end
end
