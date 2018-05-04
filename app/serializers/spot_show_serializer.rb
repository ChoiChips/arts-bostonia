class SpotShowSerializer < ActiveModel::Serializer

  attributes :id, :name, :location, :description, :photo, :artist, :user_reviews, :user_id

  has_many :reviews

  def user_reviews
    object.reviews.where(user: scope)
  end
end
