class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD


   has_many :reviews
   has_many :spots
   mount_uploader :avatar, AvatarUploader
=======
  mount_uploader :avatar, AvatarUploader
>>>>>>> 65beb28ab14ce63bc8a957df8f58ae27f37cf284
end
