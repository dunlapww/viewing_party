class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def self.exists?(friend_id, current_user_id)
    Friendship.where(
      user_id: current_user_id,
      friend_id: friend_id
    ).count > 0 || Friendship.where(
        user_id: friend_id,
        friend_id: current_user_id
      ).count > 0
  end
end
