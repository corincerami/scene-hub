class Show < ActiveRecord::Base
  belongs_to :venue

  has_many :show_bands
  has_many :bands, through: :show_bands
end
