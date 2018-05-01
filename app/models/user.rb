class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  def member?
    role == "member"
  end
  def admin?
    role == "admin"
  end
end
