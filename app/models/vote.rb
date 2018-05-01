class Vote < ApplicationRecord
  validates :value, numericality: {
    only_integer: true,
    greater_than_or_equal_to: -1,
    less_than_or_equal_to: 1
  }
  has_many :reviews
  has_many :users
end
