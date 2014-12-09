class CreateGenreBands < ActiveRecord::Migration
  def change
    create_table :genre_bands do |t|
      t.integer :genre_id, null: false
      t.integer :band_id, null: false
    end
  end
end
