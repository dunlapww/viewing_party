require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :uuid }
    it { should validate_presence_of :title }
  end

  describe 'relationships' do
    it { should have_many :viewing_parties }
  end
end
