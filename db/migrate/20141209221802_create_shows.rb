class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.text :details
      t.datetime :datetime, null: false
    end
  end
end
