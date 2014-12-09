class Show < ActiveRecord::Base
  has_many :venue_shows
  has_many :venues, through: :venue_shows
end
