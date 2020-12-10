class ViewingParty < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :attendees
  has_many :friends, through: :attendees

  validates :user_id, presence: true
  validates :movie_id, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :date, inclusion: { in: (Date.today..Date.today + 5.years) }
  validates :duration, numericality: { greater_than_or_equal_to: 5 }
end
