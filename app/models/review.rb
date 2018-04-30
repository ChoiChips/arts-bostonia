class Review < ApplicationRecord

  validates :description, presence: true
  validates :rating, presence: true

  belongs_to :spot
  belongs_to :user 
end
