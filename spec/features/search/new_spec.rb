require 'rails_helper'

RSpec.describe 'Discover Page (/discover)' do
  describe 'As a logged in user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit discover_path
    end
    it "I can search for the top 40 movies" do
      VCR.use_cassette('movies_top_40') do
        click_button 'Discover Top 40'
        expect(current_path).to eq results_path
      end
    end
    it "I can search for a movie by title" do
      VCR.use_cassette('movie_search_fight_club') do
        fill_in :search, with: "Fight Club"
        click_on 'Search'
        expect(current_path).to eq results_path
      end
    end
  end
end
