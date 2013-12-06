class User < ActiveRecord::Base

  has_secure_password
  has_many :memberships
  has_many :chats, through: :memberships
  

end