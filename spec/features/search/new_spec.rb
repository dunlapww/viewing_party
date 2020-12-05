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
    end
    it "I can search for the top 40 movies" do
      visit '/discover'
      click_button 'Discover Top 40'
      expect(current_path).to eq '/results'
    end
  end
end