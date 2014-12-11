module ShowHelper
  Dotenv.load

  def check_distance(user_zip, show_zip)
      api_key = ENV["ZIP_CODE_API_KEY"]
      zip_api_response = URI("https://www.zipcodeapi.com/rest/#{api_key}/distance.json/#{user_zip}/#{show_zip}/mile")
      response = Net::HTTP.get(zip_api_response)
      distance = JSON.parse(response)["distance"]
  end
end
