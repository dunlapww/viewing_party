require 'rails_helper'

RSpec.describe 'Welcome page' do
  describe 'As a visitor' do
    before(:each) do
      visit welcome_index_path
    end

    it 'I can see a welcome message' do
      expect(page).to have_content('Welcome to Viewing Party!')
    end

    it 'I see a description of the application' do
      expect(page).to have_content('A place to get your friends together to watch a movie.')
    end

    it 'I see a button and link to login' do
      expect(page).to have_button('Login')
      within('.main-nav') do
        expect(page).to have_link('Login')
      end
    end

    it 'I see a link to register' do
      expect(page).to have_link('Register')
    end

    it 'I cannot access user specific pages' do
      not_found = "The page you were looking for doesn't exist (404)"
      VCR.insert_cassette("movie_detail_500_visitor")
        visit movie_path(550)
        expect(page).to have_content(not_found)

        visit new_vp_path(550)
        expect(page).to have_content(not_found)
      VCR.eject_cassette

      visit dashboard_path
      expect(page).to have_content(not_found)

      visit discover_path
      expect(page).to have_content(not_found)

      VCR.insert_cassette("results_for_nothing_visitor")
        visit results_path
        expect(page).to have_content(not_found)
      VCR.eject_cassette
    end
  end
end
