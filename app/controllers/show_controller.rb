class ShowController < ApplicationController
  helper ShowHelper

  def new
    @show = Show.new
  end

  def index
    @shows = Show.all.order(:datetime)
    @user_zip = params[:zip_code]
  end

  def create
    @show = Show.new(datetime: params[:datetime], details: params[:details])
    if @show.save
      band = Band.find_or_create_by(name: params[:band_name])
      ShowBand.find_or_create_by(band_id: band.id, show_id: @show.id)
      genre = Genre.find_or_create_by(genre: params[:band_genre])
      GenreBand.find_or_create_by(band_id: band.id, genre_id: genre.id)
      venue = Venue.find_or_create_by(name: params[:venue_name], description: params[:venue_description],
                                      street_1: params[:venue_street_1], street_2: params[:venue_street_2],
                                      city: params[:venue_city], state: params[:venue_state],
                                      zip_code: params[:venue_zip_code])
      VenueShow.find_or_create_by(venue_id: venue.id, show_id: @show.id)
      redirect_to '/shows', notice: "Show created!"
    else
      render :new
    end
  end
end
