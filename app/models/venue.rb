class Venue < ActiveRecord::Base
  has_many :shows

  # required for geokit location services
  acts_as_mappable
  validates_presence_of :name, :street_1, :city, :state, :zip_code, :lat, :lng
end
