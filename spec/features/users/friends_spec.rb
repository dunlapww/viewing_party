require 'rails_helper'

describe 'Friends' do
  describe 'As a logged in user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      @friend = User.create(
        email: 'friend@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      visit "/login"
      fill_in 'email', with: 'testing@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_on "Login"
      visit '/dashboard'
    end

    it 'I can add a friend that exists' do
      fill_in :friend_email, with: 'friend@example.com'
      click_on 'Add Friend'

      expect(page).to have_content(@friend.email)
      friendship = Friendship.last
      expect(friendship.user_id).to eq(@user.id)
      expect(friendship.friend_id).to eq(@friend.id)
    end

    it 'If I have no friends, it tells me. Sad.' do
      expect(page).to_not have_content(@friend.email)
      expect(page).to have_content("We can't find any friends, add one!")
    end
  end

end
