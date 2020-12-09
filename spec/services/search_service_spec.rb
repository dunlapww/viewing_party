require 'rails_helper'

RSpec.describe SearchService do
  describe 'instance methods' do
    describe '#search_data' do
      it 'can return search data' do
        VCR.use_cassette('movies_search_service') do
          movie_title = 'Fight Club'
          page = 1
          results = SearchService.search(movie_title, page)
          expect(results).to be_a Array
          expect(results.count).to be_between(0, 20)

          expect(results.first).to have_key :id
          expect(results.first[:id]).to be_a Integer

          expect(results.first).to have_key :title
          expect(results.first[:title]).to be_a String

          expect(results.first).to have_key :title
          expect(results.first[:title]).to be_a String

          expect(results.first).to have_key :poster_path
          expect(results.first[:poster_path]).to be_a String

          expect(results.first).to have_key :vote_average
          expect(results.first[:vote_average]).to be_a(Integer).or be_a Float
        end
      end
    end
  end
end
