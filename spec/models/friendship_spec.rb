require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :friend }
  end

  describe 'class methods' do
    it '#exists?' do
      @user = User.create!(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      @friend = User.create!(
        email: 'friend@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      @user.friends << @friend
      @loser = User.create!(
        email: 'loser@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )

      current_user = @user
      expect(Friendship.exists?(@friend.id, current_user.id)).to eq(true)
      current_user = @friend
      expect(Friendship.exists?(@user.id, current_user.id)).to eq(true)
      current_user = @loser
      expect(Friendship.exists?(@user.id, current_user.id)).to eq(false)
    end
  end
end
