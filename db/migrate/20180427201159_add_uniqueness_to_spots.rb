class AddUniquenessToSpots < ActiveRecord::Migration[5.2]
  def change
    add_index :spots, :name, unique: true
  end
end
