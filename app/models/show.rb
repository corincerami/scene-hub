class Show < ActiveRecord::Base
  has_many :venue_shows
  has_many :venues, through: :venue_shows

  has_many :show_bands
  has_many :bands, through: :show_bands
end
