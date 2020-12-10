class ViewingParty < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :friends, through: :attendees, dependent: :destroy

  validates :user_id, presence: true
  validates :movie_id, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :date, inclusion: { in: (Time.zone.today..Time.zone.today + 5.years) }
  validates :duration, numericality: { greater_than_or_equal_to: 5 }
end
