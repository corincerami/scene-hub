class VenueController < ApplicationController
  def new
  end

  def index
    @venues = Venue.all
  end

  def create
    Venue.create(name: params[:venue_name], description: params[:venue_description],
                street_1: params[:street_1], street_2: params[:street_2],
                city: params[:city], state: params[:state], zip_code: params[:zip_code])
    redirect_to '/'
  end
end

  # create_table "venues", force: true do |t|
  #   t.string "name",        null: false
  #   t.text   "description"
  #   t.string "street_1",    null: false
  #   t.string "street_2"
  #   t.string "city",        null: false
  #   t.string "state",       null: false
  #   t.string "zip_code",    null: false
  # end
