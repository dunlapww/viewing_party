require 'rails_helper'

RSpec.describe SearchFacade do
  describe 'class methods' do
    xit '.top_rated' do
      VCR.use_cassette('top_rated_results') do
        movie_title = 'Fight Club'
        page = 1
        results = SearchFacade.search(movie_title, page)
        
      end
    end

    it '.search' do
      VCR.use_cassette('search_movies_results') do
        uuid = 550
        results = SearchFacade.top_rated(uuid)

        expect(results).to be_a MovieDetail
        # expect(results.count).to be_a(0..20)

      end
    end
  end
end
