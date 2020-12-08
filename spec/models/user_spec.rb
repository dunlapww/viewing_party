require 'rails_helper'
require 'date'
require 'time'

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
    it { should have_many :inverse_friendships }
    it { should have_many(:inverse_friends).through(:inverse_friendships) }
    it { should have_many :viewing_parties }
    it { should have_many :invitations }
    it { should have_many(:parties).through(:invitations) }

  end

  describe 'instance methods' do
    before :each do
      @user = User.create!(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      @friend1 = User.create!(
        email: 'friend1@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      @friend2 = User.create!(
        email: 'friend2@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
    end
    it ".password_complexity" do
      expect(@user.password_complexity).to eq(nil)

      bad_user = User.new(
        email: 'testing1@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      error = ["Password needs to be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character."]
      expect(bad_user.password_complexity).to eq(error)
    end

    # it ".attendee_parties" do
    #   fightclub = Movie.create!(title: 'Fight Club', uuid: 550)
    #   dantesinferno = Movie.create!(title: "Dante's Inferno", uuid: 540)
    #   vp = @user.viewing_parties.create!(
    #     movie_id: fightclub.id,
    #     duration: 200,
    #     date: Date.today,
    #     time: Time.now
    #   )
    #   dante_vp = @user.viewing_parties.create!(
    #     movie_id: dantesinferno.id,
    #     duration: 210,
    #     date: Date.today,
    #     time: Time.now
    #   )
    #   vp.attendees.create!(friend_id: @friend1.id)
    #   vp.attendees.create!(friend_id: @friend2.id)
    #   dante_vp.attendees.create!(friend_id: @friend1.id)
    #
    #   expect(@friend1.attendee_parties).to eq([vp, dante_vp])
    #   expect(@friend2.attendee_parties).to eq([vp])
    #   expect(@user.attendee_parties).to eq([])
    #
    # end
  end
end
