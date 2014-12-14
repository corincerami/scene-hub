class GenreBand < ActiveRecord::Base
  belongs_to :genre
  belongs_to :band

  validates_presence_of :genre_id, :band_id
end
