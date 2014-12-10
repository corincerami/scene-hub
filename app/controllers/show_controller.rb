class ShowController < ApplicationController
  def new
    @show = Show.new
  end

  def index
    @shows = Show.all
  end

  def create
    @show = Show.new(datetime: params[:datetime], details: params[:details])
    if @show.save
      band = Band.find_by(name: params[:band_name])
      ShowBand.create(band_id: band.id, show_id: @show.id)
      venue = Venue.find_by(name: params[:venue_name])
      VenueShow.create(venue_id: venue.id, show_id: @show.id)
      redirect_to '/shows', notice: "Show created!"
    else
      render :new
    end
  end
end
