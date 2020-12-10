require 'rails_helper'

RSpec.describe MovieFacade do
  describe 'class methods' do
    it '.movie_details' do
      VCR.use_cassette('movie_detail_550_movie_details') do
        uuid = 550
        results = MovieFacade.movie_details(uuid)
        expect(results).to be_a MovieDetail
        expect([results].count).to eq(1)
      end
    end

    it '.review_details' do
      VCR.use_cassette('movie_detail_550_review_details') do
        uuid = 550
        results = MovieFacade.review_details(uuid)
        expect(results).to be_a Array
        expect(results.first).to be_a Review
      end
    end

    it '.cast_details' do
      VCR.use_cassette('movie_detail_550_cast_details') do
        uuid = 550
        results = MovieFacade.cast_details(uuid)

        expect(results).to be_a Array
        expect(results.first).to be_a CastMember
      end
    end
  end
end
