class Spot < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
