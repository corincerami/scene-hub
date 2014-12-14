class ShowBand < ActiveRecord::Base
  belongs_to :show
  belongs_to :band

  validates_presence_of :show_id, :band_id
end
