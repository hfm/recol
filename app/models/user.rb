class User < ActiveRecord::Base
  def self.find_by_omniauth(auth)
    self.find_by(provider: auth["provider"], uid: auth["uid"])
  end

  def self.create_with_omniauth(auth)
    create!do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nickname = auth["info"]["nickname"]
      user.image = auth["info"]["image"]
      user.location = auth["info"]["location"]
      user.token = auth["credentials"]["token"]
    end
  end
end
