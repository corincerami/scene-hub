class CreateVenueShows < ActiveRecord::Migration
  def change
    create_table :venue_shows do |t|
      t.integer :venue_id
      t.integer :show_id
    end
  end
end
