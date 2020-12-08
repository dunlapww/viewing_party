require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe 'validations' do
    it { should validate_presence_of :friend_id }
    it { should validate_presence_of :viewing_party_id }
  end

  describe 'relationships' do
    it { should belong_to :viewing_party }
    it { should belong_to :friend }
  end

end
