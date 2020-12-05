require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many :friendships }
    it { should have_many(:friends).through(:friendships) }
  end

  describe 'instance methods' do
    it ".password_complexity" do
      user = User.new(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      expect(user.password_complexity).to eq(nil)

      bad_user = User.new(
        email: 'testing@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      error = ["Password needs to be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character."]
      expect(bad_user.password_complexity).to eq(error)
    end
  end
end
