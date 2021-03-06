
# Our Viewing Party
[![Build Status](https://travis-ci.com/dunlapww/viewing_party.svg?branch=main)](https://travis-ci.com/dunlapww/viewing_party)

This web application allows a user to view movie titles and schedule viewing parties with their friends.

## Table of Contents
  - [What it does](#what-it-does)
  - [How to Install](#how-to-install)
  - [Testing](#testing)
  - [Example Usage](#feature-tests)
  - [Licenses](#licenses)
  - [Project Leads](#project-leads)
  - [Acknowledgments](#acknowledgments)


## What it does
This App allows a visitor to register or login search the MovieDB using keywords or viewing the top 40 movies.  A user can click on a specific title to see more details about the film and have the option to create a viewing party.  On the viewing party page, they can schedule a duration, date, and time for the event, and also invite their friends (if they are registered users of the site).  Once a party is scheduled, the event is added to the user's dashboard as well as their invited friends' dashboards.

[Try it out here!](https://viewing-party-gkw.herokuapp.com/)

For exploration, use below credentials:
```
login: new_user@email.com
password: Test1234!
```

## How to install
To install and run this application locally:

1. To setup the repository locally, from your command line:
```
$git clone git@github.com:dunlapww/viewing_party.git
$bundle
$rails db:{create,migrate,seed}
```
2. To run it on your local server type 'rails s' into the command line:
```
$rails s
```
3. Open your web browser and navigate to http://localhost:3000/

You should now see the welcome page for the application!
https://developers.themoviedb.org/

## Testing
This application uses the below test suite:
```
gem 'rspec-rails'
gem 'capybara'
gem 'launchy'
gem 'simplecov'
gem 'shoulda-matchers'
gem 'nyan-cat-formatter'
gem 'vcr'
gem 'webmock'
```

Both features and models should be tested

### Feature Tests
Ensure the functionality of a component of the user experience.  Every aspect of functionality should have a test built for it. 

As an example, The below feature test ensures a user can successfully login
![](/read_me_images/feature_test.png)


### Model Tests
Ensures the backend database and classes work properly

As an example, the below test ensures that the User table has the proper validations and relationships, and ensures our validations are working properly:
![](/read_me_images/user_spec.png)

## Example Usage

#### Welcome: 
When you first visit, the user is greeted with the login page where they can either login or register as a new user.

<img src="/read_me_images/welcome.png" width="600">

#### Dashboard
* The user can invite some friends who are also users by typing their email and clicking 'Add Friend'
* Alternatively, they can begin perusing movie titles by clicking 'Discover Movies'

<img src="/read_me_images/dashboard.png" width="400">
#### Discover
* From the discover page the user has the option to view the top 40 movies or to perform a keyword search for movie titles.

<img src="/read_me_images/discover.png" width="400">

#### Results
* Searching by either option will send the user to the results page where they will see a list of movies.  They can click on any title to see more details about the movie.

<img src="/read_me_images/results.png" width="400">

#### Movie Details
* On the movie Details page they are given the option to schedule a viewing party.  Clicking 'Create Viewing Party' allows them to scheduling a viewing party

<img src="/read_me_images/movie_details.png" width="400">

#### Scheduling a Viewing Party
* To schedule a viewing party, a user must select a party duration, date, time, and select some friends to invite.  In this case we'll invite only a selection of our friends.  Clicking 'Create Viewing Party' schedules the event and returns the user to their dashboard.

<img src="/read_me_images/viewing_party.png" width="400">

#### Dashboard with parties
* Now the party has been scheduled, the party appears on both the user's dashboard and their invited friends' dashboard.  The user now has the option to schedule more parties or to logout.

User Dashboard | Friend Dashboard | 
--- | --- |
<img src="/read_me_images/dashboard_vp_success.png" width="300"> | <img src="/read_me_images/friend_dashboard_success.png" width="300"> | 



## Licenses
This application was created 

* using the [MovieDB](https://developers.themoviedb.org/)
* Ruby 2.5.3
* Rspec 

## Project Leads
* George Soderholm
* Kate Tester
* Will Dunlap

## Acknowledgements
These are the resources and people that helped us along the way!
* [Complex Passwords](https://github.com/heartcombo/devise/wiki/How-To:-Set-up-simple-password-complexity-requirements)
* [Email Validation](https://blog.mailtrap.io/rails-email-validation/)
* [Flexbox Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
* Our Instructors, Dione and Ian
* 2008 BE Cohort!
