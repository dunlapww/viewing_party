require 'rails_helper'

RSpec.describe MovieService, type: :model do
  describe 'instance methods' do
    xit '.movie_data' do
      VCR.use_cassette('movie_detail_550') do
        movie_service = MovieService.new(550)
        expect(movie_service.movie_data[:runtime]).to eq(139)
        # expect(movie_service.movie_data[:title]).to eq('Fight Club')
        # expect(movie_service.movie_data[:tagline]).to eq('Mischief. Mayhem. Soap.')
      end
    end
  end
end
