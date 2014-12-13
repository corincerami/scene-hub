class ShowController < ApplicationController
  def new
    @show = Show.new
  end

  def index
    @user_zip = params[:zip_code]
    if @user_zip
      # geokit docs seems to be incorrect and .join needs
      # to be used with associated tables
      @shows = Show.joins('LEFT OUTER JOIN venues ON venues.id =
                          shows.venue_id').within(25, :origin=>@user_zip).page(params[:page])
    else
      @shows = Show.page(params[:page])
    end
  end

  before_action :authenticate_user!, only: [:create]
  def create
    venue = Venue.find_or_create_by(name: params[:venue_name], description: params[:venue_description],
                                    street_1: params[:venue_street_1], street_2: params[:venue_street_2],
                                    city: params[:venue_city], state: params[:venue_state],
                                    zip_code: params[:venue_zip_code])
    @show = Show.new(datetime: params[:datetime], details: params[:details], venue_id: venue.id)
    if @show.save
      band = Band.find_or_create_by(name: params[:band_name])
      ShowBand.find_or_create_by(band_id: band.id, show_id: @show.id)
      genre = Genre.find_or_create_by(genre: params[:band_genre])
      GenreBand.find_or_create_by(band_id: band.id, genre_id: genre.id)
      redirect_to '/shows', notice: "Show created!"
    else
      render :new
    end
  end
end
