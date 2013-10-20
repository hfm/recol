class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, length: { maximum: 50 }
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
end
