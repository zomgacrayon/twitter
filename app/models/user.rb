class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :tweets
  has_many :followers, :class_name => "Followings", :foreign_key => "user_id"
  has_many :following, :class_name => "Followings", :foreign_key => "follower_id"

  def self.authenticate(username,password)
    user = User.where(username: username).first

    if user && user.password == password
      user
    else
      nil
    end
  end
end