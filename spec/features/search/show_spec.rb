require 'rails_helper'

describe '/discover' do
  describe 'As a registered user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit '/discover'
    end
    it 'when I do a keyword search, I see the top 40 search results' do
      VCR.use_cassette('movie_search_fight_club') do
        fill_in :search, with: "Fight Club"
        click_on 'Search'
        expect(page).to have_button('Discover Top 40')
        expect(page).to have_field(:search)
        expect(current_path).to eq '/results'
        expect(page).to have_link('Fight Club')
        expect(page).to have_content("Vote Average: 8.4")
        expect(page).to have_css(".movie", count: 22)
      end
    end
    it 'when I click top 40, I see the top 40 search results' do
      VCR.use_cassette('movies_top_40') do
        click_on 'Discover Top 40'
        expect(page).to have_link('Fight Club')
        expect(page).to have_content("Vote Average: 8.4")
        expect(page).to have_css(".movie", count: 40)
      end
      #what if no search results
    end
  end
end