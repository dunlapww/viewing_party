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

    it '.reco_details' do
      VCR.use_cassette('movie_detail_550_recos_facade') do
        uuid = 550
        results = MovieFacade.reco_details(uuid)

        expect(results).to be_a Array
        expect(results.first).to be_a MovieDetail
      end
    end

    it '.similar_details' do
      VCR.use_cassette('movie_detail_550_similar_facade') do
        uuid = 550
        results = MovieFacade.similar_details(uuid)

        expect(results).to be_a Array
        expect(results.first).to be_a MovieDetail
      end
    end
  end
end
