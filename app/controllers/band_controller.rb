class BandController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  before_action :authenticate_user!, only: [:create]
  def create
    @band = Band.new(name: params[:band_name])

    if @band.save
      genre = Genre.find_or_create_by(genre: params[:genre])
      GenreBand.find_or_create_by(band_id: @band.id, genre_id: genre.id)
      redirect_to '/bands', notice: "Band created!"
    else
      render :new
    end
  end
end
