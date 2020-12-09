require 'rails_helper'

RSpec.describe MovieSearch, type: :model do
  describe 'instance methods' do
    it 'results' do
      VCR.use_cassette('movie_empty_search_model') do
        search = MovieSearch.new("")
        expect(search.results).to eq([])
      end
      VCR.use_cassette('movie_word_search_model') do
        search = MovieSearch.new("word")
        expect(search.results.first).to be_an(Hash)
        expect(search.results.first[:original_title]).to be_an(String)
        expect(search.results.first[:vote_average].to_f).to be_an(Float)
        expect(search.results.last[:original_title]).to be_an(String)
        expect(search.results.last[:vote_average].to_f).to be_an(Float)
      end
    end
    it 'count' do
      VCR.use_cassette('movie_hello_search_model') do
        search = MovieSearch.new("hello")
        expect(search.count).to eq(40)
      end
      VCR.use_cassette('movie_jmkls_search_model') do
        search = MovieSearch.new("jmkls")
        expect(search.count).to eq(0)
      end
    end
  end
end
