require 'rails_helper'

RSpec.describe TopMovieSet, type: :model do
  describe 'instance_methods' do
    it 'count' do
      VCR.use_cassette('Top40_search_model') do
        search = TopMovieSet.new
        expect(search.count).to eq(40)
      end
    end
  end
end
