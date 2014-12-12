class AddLatLngToVenues < ActiveRecord::Migration
  include Geokit::Geocoders

  def up
    add_column :venues, :lat, :float, null: false, default: 0.0
    add_column :venues, :lng, :float, null: false, default: 0.0

    Venue.all.each do |venue|
      address = "#{venue.street_1}, #{venue.city}, #{venue.state}"
      loc=MultiGeocoder.geocode(address)
      if loc.success
        venue.update(lat: loc.lat)
        venue.update(lng: loc.lng)
        venue.save
      end
    end
  end

  def down
    remove_column :venues, :lat
    remove_column :venues, :lng
  end
end
