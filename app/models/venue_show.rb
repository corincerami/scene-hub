class VenueShow <ActiveRecord::Base
  belongs_to :show
  belongs_to :venue

  validates_presence_of :show_id, :venue_id
end
