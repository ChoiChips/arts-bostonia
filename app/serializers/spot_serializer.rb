class SpotSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo, :artist, :description, :location
end
