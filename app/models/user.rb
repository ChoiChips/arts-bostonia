class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   has_many :reviews
   has_many :spots
   mount_uploader :avatar, AvatarUploader
end
