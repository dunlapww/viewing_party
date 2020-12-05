require 'rails_helper'

describe 'dashboard' do
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
      click_on "Login"
      visit '/dashboard'
    end
    
    it "I see a button called 'Discover Movies'" do
      expect(page).to have_button "Discover Movies"
    end

    it "I see a friends section" do
      expect(page).to have_css('.friends')
    end

    it "I can see a viewing parties section" do
      expect(page).to have_css('.viewing-parties')
    end
    it "I can see a welcome message" do
      expect(page).to have_content("Welcome #{@user.email}!")
    end
  end

end
