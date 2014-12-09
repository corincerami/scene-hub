class CreateShowBands < ActiveRecord::Migration
  def change
    create_table :show_bands do |t|
      t.integer :band_id, null: false
      t.integer :show_id, null: false
    end
  end
end
