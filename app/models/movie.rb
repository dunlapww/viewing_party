class Movie < ApplicationRecord
  has_many :viewing_parties, dependent: :destroy

  validates :uuid, presence: true
  validates :title, presence: true
end
