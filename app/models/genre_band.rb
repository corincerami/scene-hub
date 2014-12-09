class GenreBand < ActiveRecord::Base
  belongs_to :genre
  belongs_to :band
end
