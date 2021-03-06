class Spot < ApplicationRecord

  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :description, presence: true

  has_many :reviews
  belongs_to :user

end
