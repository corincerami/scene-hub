class ShowController < ApplicationController

  def new
    @show = Show.new
  end

  Dotenv.load

  def check_distance(user_zip, show_zip)
      api_key = ENV["ZIP_CODE_API_KEY"]
      zip_api_response = URI("https://www.zipcodeapi.com/rest/#{api_key}/distance.json/#{user_zip}/#{show_zip}/mile")
      response = Net::HTTP.get(zip_api_response)
      distance = JSON.parse(response)["distance"]
  end

  def index
    @user_zip = params[:zip_code]
    shows = Show.order(:datetime)
    @shows = Array.new
    shows.each do |show|
      if @user_zip && !@user_zip.empty?
        if check_distance(@user_zip, show.venue.zip_code) < 25
          @shows << show
        end
      else
        @shows = shows
      end
    end
    @shows = Kaminari.paginate_array(@shows).page(params[:page])
  end

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
