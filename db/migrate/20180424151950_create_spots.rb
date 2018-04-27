class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.text :description, null: false
      t.string :photo
      t.string :artist

    end
  end
end
