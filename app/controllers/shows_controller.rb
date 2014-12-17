class ShowsController < ApplicationController
  include Geokit::Geocoders

  def new
    @show = Show.new
    @band = Band.new
    @venue = Venue.new
    @genre = Genre.new
  end

  def index
    @user_zip = params[:zip_code]
    if @user_zip
      # geokit docs seems to be incorrect and .join needs
      # to be used with associated tables
      @shows = Show.joins(:venue).within(25, :origin=>@user_zip).order(:datetime).page(params[:page])
    else
      @shows = Show.order(:datetime).page(params[:page])
    end
  end

  def show
    @show = Show.find(params[:id])
    @comment = @show.comments.build
    @comments = Comment.where(show_id: @show.id)
  end

  before_action :authenticate_user!, only: [:create, :new]
  def create
    @show = Show.new
    venue = Venue.find_or_initialize_by(name: params[:venue_name], description: params[:venue_description],
                                    street_1: params[:venue_street_1], street_2: params[:venue_street_2],
                                    city: params[:venue_city], state: params[:venue_state],
                                    zip_code: params[:venue_zip_code])
    if check_zip_code(params[:venue_zip_code])
      address = "#{venue.street_1}, #{venue.city}, #{venue.state}"
      # geokit module to convert address into longitude and latitude
      loc = MultiGeocoder.geocode(address)
      if loc.success
        venue.lat = loc.lat
        venue.lng = loc.lng
        venue.save
      end
      @show = Show.new(datetime: params[:datetime], details: params[:details], venue_id: venue.id)
      @band = Band.find_or_create_by(name: params[:band_name])
      genre = Genre.find_or_create_by(genre: params[:band_genre])
      if @band.save
        GenreBand.create(band_id: @band.id, genre_id: genre.id)
        if @show.save
          ShowBand.create(band_id: @band.id, show_id: @show.id)
          redirect_to shows_path, notice: "Show created!"
        else
          render :new
        end
      else
        render :new
      end
    else
      render :new
    end
  end

  Dotenv.load
  def check_zip_code(zip_code)
    api_key = ENV["ZIP_CODE_API_KEY"]
    zip_api_response = URI("http://www.zipcodeapi.com/rest/#{api_key}/info.json/#{zip_code}/degrees")
    response = Net::HTTP.get(zip_api_response)
    zip = JSON.parse(response)["zip_code"]
    if zip.nil?
      flash[:error] = "Invalid zip code"
    end
    !zip.nil?
  end
end
