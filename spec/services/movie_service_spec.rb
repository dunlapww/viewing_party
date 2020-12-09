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
    end
    describe '#review_data' do
      it 'can return review data' do
        VCR.use_cassette('movie_detail_550_movie_service_review') do
          review = MovieService.review_data(550)
          expect(review).to be_a Hash

          expect(review).to have_key :id
          expect(review[:id]).to be_a Integer

          expect(review).to have_key :page
          expect(review[:page]).to be_a Integer

          expect(review[:results][0]).to have_key :author
          expect(review[:results][0][:author]).to be_a String

          expect(review[:results][0]).to have_key :content
          expect(review[:results][0][:content]).to be_a String

          expect(review[:results][0]).to have_key :url
          expect(review[:results][0][:url]).to be_a String
        end
      end
    end
    describe '#cast_data' do
      it 'can return cast data' do
        VCR.use_cassette('movie_detail_550_movie_service_cast') do
          cast = MovieService.cast_data(550)
          expect(cast).to be_a Hash

          expect(cast).to have_key :id
          expect(cast[:id]).to be_a Integer

          expect(cast).to have_key :cast
          expect(cast[:cast]).to be_a Array

          expect(cast[:cast][0]).to have_key :name
          expect(cast[:cast][0][:name]).to be_a String

          expect(cast[:cast][0]).to have_key :character
          expect(cast[:cast][0][:character]).to be_a String
        end
      end
    end
    describe '#cast_data' do
      it 'can return cast data' do
        VCR.use_cassette('movie_detail_550_movie_service_cast') do
          cast = MovieService.cast_data(550)
          expect(cast).to be_a Hash

          expect(cast).to have_key :id
          expect(cast[:id]).to be_a Integer

          expect(cast).to have_key :cast
          expect(cast[:cast]).to be_a Array

          expect(cast[:cast][0]).to have_key :name
          expect(cast[:cast][0][:name]).to be_a String

          expect(cast[:cast][0]).to have_key :character
          expect(cast[:cast][0][:character]).to be_a String
        end
      end
    end
    describe '#top_rated' do
      it 'can return top_rated data' do
        VCR.use_cassette('top_rated_movies') do
          page = 1
          top_rated = MovieService.top_rated(page)
          expect(top_rated).to be_a Hash
          expect(top_rated[:results].count).to eq(20)

          dantes = top_rated[:results].first
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
