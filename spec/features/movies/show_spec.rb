require 'rails_helper'

RSpec.describe 'Movie Details Page' do
  describe 'As a logged in user' do
    before :each do
      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "I see a button to 'create viewing party'" do
      VCR.use_cassette("movie_detail_550_m_request") do
        movie_detail = MovieFacade.movie_details(550)
        visit movie_path(movie_detail.uuid)
        expect(page).to have_button 'Create Viewing Party'
      end
    end

    it "when I click on Create Viewing Party i'm redirected to movies/:id/viewing-party/new" do
      VCR.use_cassette("movie_detail_550_viewing_party_2") do
        movie_detail = MovieFacade.movie_details(550)
        visit movie_path(movie_detail.uuid)
        click_on 'Create Viewing Party'
        expect(current_path).to eq(new_vp_path(movie_detail.uuid))
      end
    end

    it "I can see movie details" do
      VCR.use_cassette("movie_all_details") do
        movie_detail = MovieFacade.movie_details(550)
        cast = MovieFacade.cast_details(550)
        cast_member = cast.first
        reviews = MovieFacade.review_details(550)
        review = reviews.second
        recos = MovieFacade.reco_details(550)
        reco = recos.second
        similar = MovieFacade.similar_details(550)
        sim1 = similar.first

        visit movie_path(movie_detail.uuid)

        expect(page).to have_content(movie_detail.title)
        expect(page).to have_content(movie_detail.vote_average)
        expect(page).to have_content('2:19')
        expect(page).to have_content(movie_detail.genres.first)
        expect(page).to have_content(movie_detail.summary)
        expect(page).to have_content(cast_member.name)
        expect(page).to have_content(cast_member.character)
        expect(page).to have_content(reviews.count)
        expect(page).to have_content(review.rating)
        expect(page).to have_content(review.author)
        expect(page).to have_content(reco.title)
        expect(page).to have_content(sim1.title)
      end
    end
  end
end
