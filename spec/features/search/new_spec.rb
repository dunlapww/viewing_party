require 'rails_helper'

describe 'Discover Page (/discover)' do
  describe 'As a logged in user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/discover'
    end
    it "I can search for the top 40 movies" do
      click_button 'Discover Top 40'
      expect(current_path).to eq '/results'
    end
    it "I can search for a movie by title" do
      fill_in :search, with: "Fight Club"
      save_and_open_page
      click_on 'Search'
      expect(current_path).to eq '/results'
    end
  end
end