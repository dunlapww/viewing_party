require 'rails_helper'

describe 'from the viewing party page' do
  describe 'as a registered user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      visit "/login"
      fill_in 'email', with: 'testing@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_on "Login"
    end
  end
  it 'I see the movie title' do
    VCR.use_cassette('movie_detail_550_vp_request') do
      movie_service = MovieService.new(550)
      visit "/movies/#{movie_service.uuid}"
      click_on 'Create Viewing Party'
      expect(page).to have_content(movie_service.data[:original_title])
    end
  end
end



# @movie_service = MovieService.new(550)
# movie_data = File.read('spec/fixtures/movie_550.json')
# reviews = File.read('spec/fixtures/reviews_550.json')
# credits = File.read('spec/fixtures/credits_550.json')

# stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=b01584c01dccf4323b39564e5363856b").
#    with(
#      headers: {
#  	  'Accept'=>'*/*',
#  	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#  	  'User-Agent'=>'Faraday v1.0.1'
#      }).
#    to_return(status: 200, body: movie_data, headers: {})

# stub_request(:get, "https://api.themoviedb.org/3/movie/#{@uuid}/reviews?api_key=#{ENV['MDB_API_KEY']}").
#    with(
#      headers: {
#  	  'Accept'=>'*/*',
#  	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#  	  'User-Agent'=>'Faraday v1.0.1'
#      }).
#    to_return(status: 200, body: reviews, headers: {})

# stub_request(:get, "https://api.themoviedb.org/3/movie/#{@uuid}/credits?api_key=#{ENV['MDB_API_KEY']}").
#    with(
#      headers: {
#  	  'Accept'=>'*/*',
#  	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#  	  'User-Agent'=>'Faraday v1.0.1'
#      }).
#    to_return(status: 200, body: credits, headers: {})