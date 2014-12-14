class Show < ActiveRecord::Base
  belongs_to :venue
  acts_as_mappable through: :venue

  has_many :show_bands
  has_many :bands, through: :show_bands
end
