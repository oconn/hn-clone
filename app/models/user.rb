class User < ActiveRecord::Base
  has_secure_password
  validates :password, :user_name, presence: true
  has_many :posts
  has_many :comments, through: :posts
end



