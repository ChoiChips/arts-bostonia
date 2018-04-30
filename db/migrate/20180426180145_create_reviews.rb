class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :description, null: false
      t.integer :rating, null: false
      t.belongs_to :spot
      t.belongs_to :user

      t.timestamps
    end
  end
end
