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
      VCR.use_cassette('movie_detail_550_m_request') do
        movie_service = MovieService.new(550)
        visit movie_path(550)
        expect(page).to have_button 'Create Viewing Party'
      end
    end

    it "when I click on Create Viewing Party i'm redirected to movies/:id/viewing-party/new" do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'
        expect(current_path).to eq(new_vp_path(550))
      end
    end

    it "shows movie details" do
      VCR.use_cassette('movie_detail_550_m_request') do
        movie_service = MovieService.new(550)
        visit movie_path(550)
        expect(page).to have_content(movie_service.data[:title])
        expect(page).to have_content(movie_service.data[:vote_average])
        expect(page).to have_content('2:19')
        expect(page).to have_content(movie_service.data[:genres].first[:name])
        expect(page).to have_content(movie_service.data[:overview])
        expect(page).to have_content(movie_service.cast[:cast].first[:name])
        expect(page).to have_content(movie_service.cast[:cast].first[:character])
        expect(page).to have_content(movie_service.reviews[:total_results])
        expect(page).to have_content(movie_service.reviews[:results].second[:author_details][:rating])
        expect(page).to have_content(movie_service.reviews[:results].first[:author])
        expect(page).to have_text('Pretty awesome movie. I')
        expect(page).to have_css('.actor', count:10)
      end
    end
  end
end
