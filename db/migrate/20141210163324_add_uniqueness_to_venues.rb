class AddUniquenessToVenues < ActiveRecord::Migration
  def change
    add_index :venues, [:name, :street_1, :city, :state], unique: true
  end
end
