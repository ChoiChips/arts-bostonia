class Vote < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :user, presence: true
  validates :review, presence: true
  validates :value, inclusion: { in: -1..1 }
  validates :user_id, uniqueness: { scope: :review_id }
end
