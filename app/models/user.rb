class User < ApplicationRecord
  validates :email, presence: true, email: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  has_secure_password
  validate :password_complexity
  # Friendships
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  # Inverse friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user, dependent: :destroy
  # Parties as Host
  has_many :viewing_parties, dependent: :destroy
  # Parties as Attendee
  has_many :invitations, class_name: 'Attendee', foreign_key: 'friend_id', dependent: :destroy
  has_many :parties, through: :invitations, source: :viewing_party, dependent: :destroy

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-at-least-one-capital-at-least-one-lower-case-at-least-one-special-character
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    msg = 'Password needs to be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character.'
    errors.add :password, msg
  end
end
