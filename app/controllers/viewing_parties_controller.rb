class ViewingPartiesController < ApplicationController

  def new
    # binding.pry
    @movie = MovieService.new(params[:uuid])
  end

  def create
    vp = viewing_party(params)
    attendees(vp, params)
    flash[:success] = "You have successfully created a party!!"
    redirect_to '/dashboard'
  end

  private

  def friends(params)
    params.select do |_email, invite|
      invite == '1'
    end.keys
  end

  def movie(params)
    Movie.create!(title: params[:movie_title], uuid: params[:uuid])
  end

  def viewing_party(params)
    current_user.viewing_parties.create!(
      date: params[:party_date],
      time: params[:party_time],
      duration: params[:party_duration],
      movie_id: movie(params).id
    )
  end

  def attendees(vp, params)
    friends(params).each do |friend|
      vp.attendees.create!(friend_id: User.find_by(email: friend).id)
    end
  end
end
