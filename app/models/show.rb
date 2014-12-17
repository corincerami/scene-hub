class Show < ActiveRecord::Base
  belongs_to :venue
  acts_as_mappable through: :venue

  has_many :show_bands
  has_many :bands, through: :show_bands

  has_many :comments

  validates_presence_of :datetime, :venue_id
end
