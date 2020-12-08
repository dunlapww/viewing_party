require 'rails_helper'

RSpec.describe MovieService do
  describe 'instance methods' do
    describe '#movie_data' do
      it 'can return movie data' do
        VCR.use_cassette('movie_detail_550_movie_service') do
          results = MovieService.movie_data(550)
          expect(results).to be_a Hash

          expect(results).to have_key :id
          expect(results[:id]).to be_a Integer

          expect(results).to have_key :title
          expect(results[:title]).to be_a String

          expect(results).to have_key :title
          expect(results[:title]).to be_a String

          expect(results).to have_key :poster_path
          expect(results[:poster_path]).to be_a String

          expect(results).to have_key :vote_average
          expect(results[:vote_average]).to be_a(Integer).or be_a Float
        end
      end
    describe '#review_data' do
      xit 'can return review data' do
        VCR.use_cassette('movie_detail_550_movie_service') do
          results = MovieService.review_data(550)
          expect(results).to be_a Hash
        end
      end
    end
    describe '#cast_data' do
      xit 'can return cast data' do
        VCR.use_cassette('movie_detail_550_movie_service') do
          results = MovieService.cast_data(550)
          expect(results).to be_a Hash
        end
      end
    end
  end
end
end
