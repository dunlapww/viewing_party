require 'rails_helper'

describe 'movies_show' do
  describe 'as a logged in user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "I see a button to 'create viewing party'" do
      VCR.use_cassette('movie_detail_550') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        expect(page).to have_button 'Create Viewing Party'
      end
    end

    it "shows movie details" do
      VCR.use_cassette('movie_detail_550') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        expect(page).to have_content(movie_service.data[:title])
        expect(page).to have_content(movie_service.data[:vote_average])
        expect(page).to have_content('2:19')
        expect(page).to have_content(movie_service.data[:genres].first[:name])
        expect(page).to have_content(movie_service.data[:overview])
        expect(page).to have_content(movie_service.cast[:cast].first[:name])
        expect(page).to have_content(movie_service.cast[:cast].first[:character])
        expect(page).to have_content(movie_service.reviews[:total_results])
        expect(page).to have_content(movie_service.reviews[:results].first[:author_details][:rating])
        expect(page).to have_content(movie_service.reviews[:results].first[:author])
        # class_type = movie_service.reviews[:results].first[:content].class
        expect(page).to have_text('Pretty awesome movie. I')
        expect(page).to have_css('.actor', count:10)
      end
    end
      #single movie endpoint (movie_data):
        #movie title: movie_data[:original_title]
        #vote average: movie_data[:vote_average]
        #run_time (display in hours mins): movie_data[:runtime]
        #assoc genres: movie_data[:genres]
        #summary description: movie_data[:overview]

      #credits endpoint - top 10 actors (cast_data):
        #cast_data[:cast].each do |actor|
          #actor_name: actor[:name]
          #actor_character: actor[:character]
        #end

      #reviews endpoint (review_data):
        #total reviews: review_data[:total_results]
        #review_data[:results].each do |review|
          #rating: review[:author_details][:rating]
          #author: review[:author]
          #contents: review[:content]
        #end

  end
end
