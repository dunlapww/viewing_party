class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.exists?(friend_id, current_user_id)
    Friendship.where(
      user_id: current_user_id,
      friend_id: friend_id
    ).count.positive? || Friendship.where(
      user_id: friend_id,
      friend_id: current_user_id
    ).count.positive?
  end
end
