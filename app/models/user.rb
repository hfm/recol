class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, length: { maximum: 50 }
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }

  def self.find_by_provider_and_uid(auth)
    self.find_by(uid: auth["uid"])
    self.find_by(provider: auth["provider"])
  end

  def self.create_with_omniauth(auth)
    create!do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end
