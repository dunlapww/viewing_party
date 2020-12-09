require 'rails_helper'

RSpec.describe 'Logout' do
  describe 'As a logged in user' do
    it "I can logout" do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      visit login_path
      fill_in 'email', with: 'testing@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_button 'Login'

      click_on('Logout')
      expect(current_path).to eq(welcome_index_path)
      expect(page).to have_content('You have successfully logged out!')
    end
  end
end
