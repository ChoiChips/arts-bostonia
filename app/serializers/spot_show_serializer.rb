class SpotShowSerializer < ActiveModel::Serializer

  attributes :id, :name, :location, :description, :photo, :artist, :user_reviews, :location_lat, :location_lng

  has_many :reviews

  def user_reviews
    object.reviews.where(user: scope)
  end
end
