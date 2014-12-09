class CreateVenueShows < ActiveRecord::Migration
  def change
    create_table :venue_shows do |t|
      t.integer :venue_id, null: false
      t.integer :show_id, null: false
    end
  end
end
