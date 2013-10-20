class User < ActiveRecord::Base
  def self.find_by_omniauth(auth)
  	self.find_by(provider: auth["provider"])
    self.find_by(uid: auth["uid"])
    self.find_by(name: auth["info"]["name"])
    self.find_by(nickname: auth["info"]["nickname"])
    self.find_by(token: auth["info"]["token"])
    self.find_by(country: auth["extra"]["raw_info"]["country"])
    self.find_by(city: auth["extra"]["raw_info"]["city"])
  end

  def self.create_with_omniauth(auth)
    create!do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nickname = auth["info"]["nickname"]
      user.token = auth["info"]["token"]
      user.country = auth["extra"]["raw_info"]["country"]
      user.city = auth["extra"]["raw_info"]["city"]
    end
  end
end
