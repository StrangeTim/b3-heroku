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
    redirect_to artist_path(@artist)
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
      if params[:display_image] === "1"
        @artist.update(:display_image_id => @artwork.id)
        @artist.save
      end
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    @artwork=Artwork.find(params[:id])
    @artist = Artist.find(params[:artist_id])
    if @artist.display_image_id === @artwork.id
      @artist.update(:display_image_id => nil)
      @artist.save
    end
    @artwork.destroy
    redirect_to artist_path(@artist)
  end
  private
  def artwork_params
    params.require(:artwork).permit(:name, :blurb, :image_description, :image)
  end

end
