class Venue < ActiveRecord::Base
  has_many :venue_shows
  has_many :shows, through: :venue_shows
end
