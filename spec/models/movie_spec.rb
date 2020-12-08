require 'rails_helper'
RSpec.describe Movie, type: :model do
  xdescribe 'validations' do
    it { should validate_presence_of :uuid }
    it { should validate_presence_of :title }
  end

  xdescribe 'relationships' do
    it { should have_many :viewing_parties }
  end
end
