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
  end
end