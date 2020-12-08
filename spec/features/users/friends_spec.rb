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
      visit login_path
      fill_in 'email', with: 'testing@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_button 'Login'
      visit dashboard_path
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

    it 'I cannot add a friend if they are not in the DB' do
      fill_in :friend_email, with: 'nothere@example.com'
      click_on 'Add Friend'

      expect(page).to have_content("Your friend isn't here yet! Tell them!")
    end

    it 'My friend sees me as a friend on their dashboard after I add them' do
      fill_in :friend_email, with: 'friend@example.com'
      click_on 'Add Friend'

      click_on 'Logout'

      visit "/login"
      fill_in 'email', with: 'friend@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_button 'Login'
      visit '/dashboard'

      expect(page).to have_content(@user.email)
    end
  end
end
