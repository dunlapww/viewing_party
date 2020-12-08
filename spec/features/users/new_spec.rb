require 'rails_helper'

RSpec.describe 'registration page' do
  describe 'As a visitor' do
    before(:each) do
      visit registration_path
    end

    it 'I see a link to login on the page' do
      within '.current-user' do
        expect(page).to have_link('Already a user? Login!')
      end
    end

    it 'I can register as a new user' do
      fill_in 'user[email]', with: 'testing@example.com'
      fill_in 'user[password]', with: '1234**USAusa'
      fill_in 'user[password_confirmation]', with: '1234**USAusa'

      click_button('Register')

      expect(current_path).to eq(dashboard_path)
    end

    it 'I cannot register with a used email' do
      current_user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )

      fill_in 'user[email]', with: 'testing@example.com'
      fill_in 'user[password]', with: '1234**USAusa'
      fill_in 'user[password_confirmation]', with: '1234**USAusa'

      click_button('Register')

      expect(page).to have_content('Email has already been taken')
      expect(current_path).to eq(registration_path)
      expect(find_field(:email).value).to eq(nil)
    end

    it 'I cannot register with a blank email' do
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: '1234**USAusa'
      fill_in 'user[password_confirmation]', with: '1234**USAusa'

      click_button('Register')

      expect(page).to have_content("Email can't be blank")
      expect(current_path).to eq(registration_path)
    end

    it 'I cannot register if passwords do not match' do
      fill_in 'user[email]', with: 'testing@example.com'
      fill_in 'user[password]', with: '1234**USAusa'
      fill_in 'user[password_confirmation]', with: 'password1'

      click_button('Register')

      expect(page).to have_content("Password confirmation doesn't match Password")
      expect(current_path).to eq(registration_path)
    end

    it 'I cannot register if the password is not strong enough' do
      fill_in 'user[email]', with: 'testing@example.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button('Register')

      expect(page).to have_content("Password needs to be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character.")
      expect(current_path).to eq(registration_path)
    end
  end
end
