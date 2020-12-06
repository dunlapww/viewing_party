class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  has_secure_password
  validate :password_complexity

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :viewing_parties

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    msg = 'Password needs to be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character.'
    errors.add :password, msg
  end
end
