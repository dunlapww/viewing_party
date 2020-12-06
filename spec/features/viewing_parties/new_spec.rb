require 'rails_helper'
require 'time'
require 'date'

describe 'from the viewing party page' do
  describe 'as a registered user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      @friend1 = User.create(
        email: 'friend1@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      @friend2 = User.create(
        email: 'friend2@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      @user.friends << @friend1
      @user.friends << @friend2

      visit "/login"
      fill_in 'email', with: 'testing@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_on "Login"
    end

    it 'I see the movie title' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        click_on 'Create Viewing Party'
        expect(page).to have_content(movie_service.data[:original_title])
      end
    end

    it 'I see a field to enter the party duration that is defaulted to the movie runtime in minutes' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        click_on 'Create Viewing Party'
        expect(find_field('party_duration').value).to eq "#{movie_service.data[:runtime]}"
      end
    end

    it 'I see a date field to enter a viewing party date' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        click_on 'Create Viewing Party'
        page.find_field('party_date')
        #fill_in :party_date, with: "12/05/2020"
      end
    end

    it 'I see a time select field to enter a viewing party time' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        click_on 'Create Viewing Party'
        page.find_field(:party_time)
      end
    end

    it 'can see a checkbox next to each friend visible' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        click_on 'Create Viewing Party'
        expect(page).to have_content('My Friends:')
        check "#{@friend1.email}"
        check "#{@friend2.email}"
      end
    end

    it 'can make a viewing party by pressing a "Create Viewing Party" button' do
      VCR.use_cassette('movie_detail_550_vp_request_generate') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        click_on 'Create Viewing Party'

        fill_in :party_duration, with: 200
        fill_in :party_date, with: Date.current
        # fill_in :party_time, with: Time.new(2020, 01, 02, 12)
        # binding.pry
        fill_in :party_time, with: Time.now
        check "#{@friend1.email}"
        check "#{@friend2.email}"

        click_on 'Create Viewing Party'
        vp = ViewingParty.last
        expect(current_path).to eq('/dashboard')
        expect(page).to have_content('You have successfully created a Party!!')
        expect(page).to have_content("#{vp.movie.title} - #{vp.date}")
      end
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
