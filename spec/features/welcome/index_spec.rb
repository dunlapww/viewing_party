require 'rails_helper'

RSpec.describe 'welcome page' do
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

    it 'I see a button to login' do
      expect(page).to have_button('Login')
    end

    it 'I see a link to register' do
      expect(page).to have_link('Register')
    end
  end
end
