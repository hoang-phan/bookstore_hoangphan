class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :async,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :order

  def check_login(password)
    if valid_password?(password)
      update_attribute(:login_count, 0)
    else
      increment!(:login_count)
    end
    login_count >= Integer(ENV['MAX_LOGIN_ATTEMPTS'])
  end
end
