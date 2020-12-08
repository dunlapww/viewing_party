require 'rails_helper'

describe MovieSearch, type: :model do
  describe 'emptysearch' do
    it 'empty_search' do
      VCR.use_cassette('movie_empty_search_model') do
        search = MovieSearch.new("")
        expect(search.results).to eq([])
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