class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
  validates :birthday, presence: true
  validate :birthday_is_date?

  def birthday_is_date?
    errors.add(:birthday, "is invalid") unless Chronic.parse(birthday)
  end

end
