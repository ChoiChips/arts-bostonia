class Spot < ApplicationRecord
  belongs_to :user
  has_many :reviews

  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :description, presence: true
end
