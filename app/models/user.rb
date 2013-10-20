class User < ActiveRecord::Base
  def self.find_by_omniauth(auth)
  	self.find_by(provider: auth["provider"])
    self.find_by(uid: auth["uid"])
    self.find_by(name: auth["info"]["name"])
    self.find_by(nickname: auth["info"]["nickname"])
    self.find_by(image: auth["info"]["image"])
    self.find_by(location: auth["info"]["location"])
    self.find_by(token: auth["info"]["token"])
  end

  def self.create_with_omniauth(auth)
    create!do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nickname = auth["info"]["nickname"]
      user.image = auth["info"]["image"]
      user.location = auth["info"]["location"]
      user.token = auth["info"]["token"]
    end
  end
end
