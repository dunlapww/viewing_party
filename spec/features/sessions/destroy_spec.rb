require 'rails_helper'

describe 'logout' do
  describe 'as a logged in user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      visit "/login"
      fill_in 'email', with: 'testing@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_button 'Login'
    end

    it "when I click 'logout' I'm returned to the welcome page" do
      click_on("Logout")
      expect(current_path).to eq("/")
      expect(page).to have_content("You have successfully logged out!")
    end
  end
end
