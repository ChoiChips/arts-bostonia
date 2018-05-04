class SpotSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo, :artist, :description, :location, :location_lat, :location_lng
end
