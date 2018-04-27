class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :rating, :description, :created_at

  belongs_to :user
  belongs_to :spot
end
