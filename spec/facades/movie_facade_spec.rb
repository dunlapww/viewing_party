require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    it '.movie_details' do
      VCR.use_cassette('movie_detail_550_movie_details') do
        results = MovieFacade.movie_details(550)

        expect(results).to be_a Hash
        expect(results.count).to eq(3)
      end
    end
  end
end
