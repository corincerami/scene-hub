class AddUniquenessToBands < ActiveRecord::Migration
def change
  add_index :bands, :name, unique: true
  add_index :genre_bands, [:genre_id, :band_id], unique: true
  add_index :genres, :genre, unique: true
end
end
