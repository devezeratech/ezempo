class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_confirmation_of :password
  mount_uploader :avatar, AvatarUploader    
  has_many :statuses
  validates :name, presence: true
end
