class Attendee < ApplicationRecord
  belongs_to :viewing_party
  belongs_to :friend, :class_name => "User"

  validates :friend_id, presence: true
  validates :viewing_party_id, presence: true
end
