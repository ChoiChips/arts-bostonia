class AddLatLngSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :location_lat, :string
    add_column :spots, :location_lng, :string
  end
end
