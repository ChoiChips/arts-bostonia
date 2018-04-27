class AddUniquenessValidationToSpots < ActiveRecord::Migration[5.2]
  def change
    add_index :spots, :name, :string, unique: true
  end
end
