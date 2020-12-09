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

      visit login_path
      fill_in 'email', with: 'testing@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_on 'Login'
    end

    xit 'I see the movie title' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_facade = MovieFacade.movie_details(550)
        # movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'
        expect(page).to have_content(movie_facade.movie_details[:original_title])
      end
    end

    xit 'I see a field to enter the party duration that is defaulted to the movie runtime in minutes' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_facade = MovieFacade.movie_details(550)
        # movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'
        expect(find_field('party_duration').value).to eq "#{movie_service.data[:runtime]}"
      end
    end

    xit 'I see a date field to enter a viewing party date' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_facade = MovieFacade.movie_details(550)
        # movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'
        page.find_field('party_date')
        #fill_in :party_date, with: "12/05/2020"
      end
    end

    xit 'I see a time select field to enter a viewing party time' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_facade = MovieFacade.movie_details(550)
        # movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'
        page.find_field(:party_time)
      end
    end

    xit 'can see a checkbox next to each friend visible' do
      VCR.use_cassette('movie_detail_550_vp_request') do
        movie_facade = MovieFacade.movie_details(550)
        # movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'
        expect(page).to have_content('My Friends:')
        check "#{@friend1.email}"
        check "#{@friend2.email}"
      end
    end

    xit 'can make a viewing party by pressing a "Create Viewing Party" button' do
      VCR.use_cassette('movie_detail_550_vp_request_generate') do
        movie_facade = MovieFacade.movie_details(550)
        # movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'

        fill_in :party_duration, with: 200
        fill_in :party_date, with: Date.current
        fill_in :party_time, with: Time.now
        check "#{@friend1.email}"
        check "#{@friend2.email}"

        click_on 'Create Viewing Party'
        vp = ViewingParty.last
        expect(current_path).to eq('/dashboard')
        expect(page).to have_content('You have successfully created a party!!')
        expect(page).to have_content("#{vp.movie.title} on #{vp.date.strftime('%m/%d/%y')}")

        click_on 'Logout'

        visit login_path
        fill_in 'email', with: 'friend1@example.com'
        fill_in 'password', with: '1234**USAusa'
        click_on 'Login'

        expect(page).to have_content("#{vp.movie.title} on #{vp.date.strftime('%m/%d/%y')}")
      end
    end

    xit 'can not make a viewing party when data is missing' do
      VCR.use_cassette('movie_detail_550_vp_request_generate') do
        movie_facade = MovieFacade.movie_details(550)
        # movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'

        check "#{@friend1.email}"
        check "#{@friend2.email}"

        click_on 'Create Viewing Party'

        expect(page).to have_content("Date can't be blank and Time can't be blank")
      end
    end

    xit 'can not make a viewing party when you do not have attendees' do
      VCR.use_cassette('movie_detail_550_vp_request_generate') do
        movie_facade = MovieFacade.movie_details(550)
        # movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'

        fill_in :party_duration, with: 200
        fill_in :party_date, with: Date.current
        fill_in :party_time, with: Time.now

        click_on 'Create Viewing Party'

        expect(page).to have_content("You need friends. Add some! Seriously.")
      end
    end

    xit 'can not make a viewing party without friends' do
      @loser_user = User.create(
        email: 'loser@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )

      click_on 'Logout'

      visit login_path
      fill_in 'email', with: 'loser@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_on 'Login'

      VCR.use_cassette('movie_detail_550_vp_request_generate') do
        movie_facade = MovieFacade.movie_details(550)
        # movie_service = MovieService.new(550)
        visit movie_path(550)
        click_on 'Create Viewing Party'

        fill_in :party_duration, with: 200
        fill_in :party_date, with: Date.current
        fill_in :party_time, with: Time.now
        expect(page).to have_content('You have no friends. Please add some on your dashboard before you make a party.')

        click_on 'Create Viewing Party'

        expect(page).to have_content("You need friends. Add some! Seriously.")
      end
    end
  end
end
