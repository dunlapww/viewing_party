require 'rails_helper'

describe 'dashboard' do
  describe 'as a logged in user' do
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
      @friend1.friends << @user

      visit "/login"
      fill_in 'email', with: 'testing@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_on "Login"
      visit '/dashboard'
    end

    it "I can click on a button called 'Discover Movies'" do
      click_on "Discover Movies"
      expect(current_path).to eq('/discover')
    end

    it "I see a friends section" do
      expect(page).to have_css('.friends')
    end

    it "I can see a viewing parties section" do
      expect(page).to have_css('.viewing-parties')
    end

    it "I can see the parties where I am the host" do
      VCR.use_cassette('movie_detail_550_vp_request_generate') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        click_on 'Create Viewing Party'

        fill_in :party_duration, with: 200
        fill_in :party_date, with: Date.current
        fill_in :party_time, with: Time.now
        check "#{@friend1.email}"
        check "#{@friend2.email}"

        click_on 'Create Viewing Party'
        vp = ViewingParty.last
        within('.host-parties') do
          expect(page).to have_content("#{vp.movie.title} on #{vp.date.strftime('%m/%d/%y')}")
        end
      end
    end

    it "I can see the parties where I am an attendee" do
      click_on 'Logout'

      visit "/login"
      fill_in 'email', with: 'friend1@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_on "Login"

      VCR.use_cassette('movie_detail_550_vp_request_generate') do
        movie_service = MovieService.new(550)
        visit "/movies/#{movie_service.uuid}"
        click_on 'Create Viewing Party'

        fill_in :party_duration, with: 200
        fill_in :party_date, with: Date.current
        fill_in :party_time, with: Time.now
        check "#{@user.email}"

        click_on 'Create Viewing Party'
        vp = ViewingParty.last

        click_on 'Logout'

        visit "/login"
        fill_in 'email', with: 'testing@example.com'
        fill_in 'password', with: '1234**USAusa'
        click_on "Login"

        within('.attendee-parties') do
          expect(page).to have_content("#{vp.movie.title} on #{vp.date.strftime('%m/%d/%y')}")
        end
      end
    end

    it "I can see a welcome message" do
      expect(page).to have_content("Welcome #{@user.email}!")
    end
  end

end
