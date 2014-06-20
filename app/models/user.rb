class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :async,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :orders
  has_many :comments

  def check_login(password)
    if valid_password?(password)
      update_attribute(:login_count, 0)
    else
      increment!(:login_count)
      save!
    end
    login_count >= Integer(ENV['MAX_LOGIN_ATTEMPTS'])
  end

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.email = auth[:info][:email]
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth[:info][:name]
    end
  end

end
