class ViewingPartiesController < ApplicationController

  def new
    render file: 'public/404' unless current_user
    @movie = MovieService.new(params[:uuid])
  end

  def create
    @movie = MovieService.new(params[:uuid])
    vp = viewing_party(params)
    if vp.save && !friends(params).empty?
      attendees(vp, params)
      flash[:success] = 'You have successfully created a party!!'
      redirect_to dashboard_path
    elsif friends(params).empty?
      flash.now[:error] = 'You need friends. Add some! Seriously.'
      render :new
    else
      flash.now[:error] = vp.errors.full_messages.to_sentence
      render :new
    end
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
    current_user.viewing_parties.new(
      date: params[:party_date],
      time: params[:party_time],
      duration: params[:party_duration],
      movie_id: movie(params).id
    )
  end

  def attendees(vp, params)
    friends(params).each do |friend_email|
      vp.attendees.create!(friend_id: User.find_by(email: friend_email).id)
    end
  end
end
