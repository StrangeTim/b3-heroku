class ArtworksController < ApplicationController

  def new
    @artist = Artist.find(params[:artist_id])
    @artwork = @artist.artworks.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @artwork = @artist.artworks.new(artwork_params)
    if @artwork.save
      if params[:display_image] === "1"
        @artist.update(:display_image_id => @artwork.id)
        @artist.save
      end
    else
      render :new
    end
    redirect_to artist_path(@artwork.artist)
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @artwork = Artwork.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artist = Artist.find(params[:artist_id])
    if @artwork.update(artwork_params)
      redirect_to artist_artwork_path(@artist, @artwork)
    else
      render :edit
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:name, :blurb, :image_description, :image)
  end

end
