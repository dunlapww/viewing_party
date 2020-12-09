require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'relationships' do
    it { should belong_to :movie }
    it { should belong_to :user }
    it { should have_many :attendees }
    it { should have_many(:friends).through(:attendees) }
  end

  describe 'validations' do
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :movie_id }

    it 'should only accept dates > today' do
      user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      movie = Movie.create(title: 'fight club', uuid: 550)

      vp = user.viewing_parties.new(movie_id: movie.id, duration: 100, date: '2018-01-01', time: Time.now, created_at: Time.now, updated_at: Time.now)
      expect(vp.save).to eq(false)
      vp = user.viewing_parties.new(movie_id: movie.id, duration: 100, date: Date.today, time: Time.now, created_at: Time.now, updated_at: Time.now)
      expect(vp.save).to eq(true)
    end

    it 'should only accept duration >= 5' do
      user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      movie = Movie.create(title: 'fight club', uuid: 550)

      vp = user.viewing_parties.new(movie_id: movie.id, duration: 3, date: Date.today, time: Time.now, created_at: Time.now, updated_at: Time.now)
      expect(vp.save).to eq(false)
      vp = user.viewing_parties.new(movie_id: movie.id, duration: 5, date: Date.today, time: Time.now, created_at: Time.now, updated_at: Time.now)
      expect(vp.save).to eq(true)
    end
  end


end
