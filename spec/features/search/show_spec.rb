require 'rails_helper'

RSpec.describe 'Results Page (/results)' do
  describe 'As a registered user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit discover_path
    end

    it 'I see < 40 results after a keyword search' do
      VCR.use_cassette('movie_search_fight_club') do
        fill_in :search, with: 'Fight Club'
        click_on 'Search'
        expect(page).to have_button('Discover Top 40')
        expect(page).to have_field(:search)
        expect(current_path).to eq results_path
        expect(page).to have_link('Fight Club')
        expect(page).to have_content("Vote Average: 8.4")
        expect(page).to have_css(".movie", count: 22)
      end
    end

    it 'I see the top 40 movies' do
      VCR.use_cassette('movies_top_40') do
        movie_details = SearchFacade.top_rated
        movie_detail = movie_details.first

        click_on 'Discover Top 40'
        expect(page).to have_link('Fight Club')
        expect(page).to have_content('Vote Average: 8.4')
        expect(page).to have_css('.movie', count: 40)
        expect(page).to have_content("Top 40 Movies")
      end
    end

    it 'I see no results when searching an empty string' do
      VCR.use_cassette('movies_empty_feature_search') do
        click_on 'Search'
        expect(page).to have_content("Your search for '' returned 0 results")
      end
    end

    it 'I see a message there are no results when none exist' do
      VCR.use_cassette('movies_jmkls_feature_search') do
        fill_in :search, with: 'jmkls'
        click_on 'Search'
        expect(page).to have_content("Your search for 'jmkls' returned 0 results")
      end
    end

    it 'I can search for something with fewer than 20 results' do
      VCR.use_cassette('hello_dolly_search') do
        fill_in :search, with: 'hello dolly'
        click_on 'Search'
        expect(page).to have_content("Your search for 'hello dolly' returned 5 results")
      end
    end
    it 'I can see an image of the movie title' do
      VCR.use_cassette('hello_dolly_search') do
        fill_in :search, with: 'hello dolly'
        click_on 'Search'
        expect(page).to have_css(".grid-box-img")
      end
    end
  end
end
