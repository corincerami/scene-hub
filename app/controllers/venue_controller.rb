class VenueController < ApplicationController
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def show
    @band = Venue.find(params[:id])
  end

  before_action :authenticate_user!, only: [:create]
  def create
    @venue = Venue.new(name: params[:venue_name], description: params[:venue_description],
                      street_1: params[:street_1], street_2: params[:street_2],
                      city: params[:city], state: params[:state], zip_code: params[:zip_code])
    if @venue.save
      redirect_to '/venues', notice: "Venue added!"
    else
      render :new
    end
  end
end
