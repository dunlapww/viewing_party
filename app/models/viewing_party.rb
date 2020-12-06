class ViewingParty < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :attendees

  validates :user_id, presence: true
  validates :movie_id, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
