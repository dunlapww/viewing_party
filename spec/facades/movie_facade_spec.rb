require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    it '.movie_details' do
      VCR.use_cassette('movie_detail_550_movie_details') do
        uuid = 550
        results = MovieFacade.movie_details(uuid)

        expect(results).to be_a Hash
        expect(results.count).to eq(3)
        expect(results.keys).to eq([:movie_data, :cast_data, :review_data])
        expect(results.values).to eq([MovieService.movie_data(uuid),  MovieService.cast_data(uuid), MovieService.review_data(uuid)])
      end
    end
  end
end
