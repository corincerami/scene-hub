class Genre < ActiveRecord::Base
  has_many :genre_bands
  has_many :bands, through: :genre_bands
end
