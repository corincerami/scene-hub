class DropVenueShows < ActiveRecord::Migration
  def up
    drop_table :venue_shows
  end

  def down
    create_table :venue_shows do |t|
      t.integer :venue_id, null: false
      t.integer :show_id, null: false
    end
  end
end
