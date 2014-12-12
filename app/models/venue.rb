class Venue < ActiveRecord::Base
  has_many :shows

  # required for geokit location services
  acts_as_mappable
end
