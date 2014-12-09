class CreateShowBands < ActiveRecord::Migration
  def change
    create_table :show_bands do |t|
      t.integer :band_id
      t.integer :show_id
    end
  end
end
