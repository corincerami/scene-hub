class AddVenueIdToShows < ActiveRecord::Migration
  def up
    add_column :shows, :venue_id, :integer

    VenueShow.all.each do |venue_show|
      show_id = venue_show.show_id
      venue_id = venue_show.venue_id
      show = Show.find(show_id)
      show.update(venue_id: venue_id)
    end

    change_column :shows, :venue_id, :integer, null: false
  end

  def down
    remove_column :shows, :venue_id
  end
end
