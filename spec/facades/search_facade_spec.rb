require 'rails_helper'

RSpec.describe SearchFacade do
  describe 'class methods' do
    it '.search' do
      VCR.use_cassette('search_results') do
        movie_title = 'Fight Club'
        page = 1
        results = SearchFacade.search(movie_title, page)

        expect(results).to be_a Array
        expect(results.count).to be_between(0, 20)
        expect(results.first).to be_a MovieDetail
      end
    end

    it '.top_rated' do
      VCR.use_cassette('top_rated_movies_results') do
        page = 1
        results = SearchFacade.top_rated(page)

        expect(results).to be_a Array
        expect(results.count).to be_between(0, 20)
        expect(results.first).to be_a MovieDetail
      end
    end
  end
end
