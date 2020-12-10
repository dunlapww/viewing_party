require 'rails_helper'

RSpec.describe SearchService do
  describe 'instance methods' do
    describe '#search_data' do
      it 'can return search data' do
        VCR.use_cassette('movies_search_service') do
          movie_title = 'Fight Club'
          results = SearchService.search(movie_title)
          expect(results).to be_a Array
          expect(results.count).to be_between(0, 40)

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

      describe '#top_forty' do
        it 'can return top_forty data' do
          VCR.use_cassette('top_rated_movies') do
            top_rated = SearchService.top_forty
            expect(top_rated).to be_a Array
            expect(top_rated.count).to eq(40)

            dantes = top_rated.first
            expect(dantes).to have_key :original_title
            expect(dantes[:original_title]).to be_a String

            expect(dantes).to have_key :id
            expect(dantes[:id]).to be_a Integer

            expect(dantes).to have_key :vote_average
            expect(dantes[:vote_average]).to be_a(Integer).or be_a Float

            expect(dantes).to have_key :poster_path
            expect(dantes[:poster_path]).to be_a String
          end
        end
      end
    end
  end
end
