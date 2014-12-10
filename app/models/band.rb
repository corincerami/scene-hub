class Band < ActiveRecord::Base
  has_many :show_bands
  has_many :shows, through: :show_bands

  has_many :genre_bands
  has_many :genres, through: :genre_bands

  validates :name, presence: true, uniqueness: true
end
