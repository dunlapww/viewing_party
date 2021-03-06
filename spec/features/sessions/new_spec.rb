require 'rails_helper'

RSpec.describe 'Login page' do
  describe 'As a visitor' do
    describe "When I visit the welcome page" do
      before :each do
        @user = User.create(
          email: 'testing@example.com',
          password: '1234**USAusa',
          password_confirmation: '1234**USAusa'
        )
        visit welcome_index_path
      end
      it 'I can login' do
        click_button 'Login'
        expect(current_path).to eq(login_path)

        fill_in 'email', with: 'testing@example.com'
        fill_in 'password', with: '1234**USAusa'

        click_button 'Login'
        expect(current_path).to eq(dashboard_path)
      end

      it 'I cannot login with invalid email' do
        click_button 'Login'
        expect(current_path).to eq(login_path)

        fill_in 'email', with: 'user@example.com'
        fill_in 'password', with: '1234**USAusa'

        click_button 'Login'
        expect(page).to have_content('Your email or password was incorrect!')
        expect(current_path).to eq(login_path)
      end

      it 'I cannot login with invalid password' do
        click_button 'Login'
        expect(current_path).to eq(login_path)

        fill_in 'email', with: 'testing@example.com'
        fill_in 'password', with: 'password'

        click_button 'Login'
        expect(page).to have_content('Your email or password was incorrect!')
        expect(current_path).to eq(login_path)
      end
    end
  end

  describe 'As a logged in user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it 'I get redirect to the dashboard if I visit the login page' do
      visit login_path

      expect(current_path).to eq(dashboard_path)
    end
  end
end
