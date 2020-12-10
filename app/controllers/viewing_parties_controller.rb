class ViewingPartiesController < ApplicationController
  def new
    render file: 'public/404' unless current_user
    @movie_detail = MovieFacade.movie_details(params[:uuid])
  end

  def create
    @movie_detail = MovieFacade.movie_details(params[:uuid])
    viewing_party = viewing_party(params)
    if !friends(params).empty? && viewing_party.save
      attendees(viewing_party, params)
      message_success
    elsif friends(params).empty?
      message_error
    else
      message_fail(viewing_party)
    end
  end

  private

  def message_success
    flash[:success] = 'You have successfully created a party!!'
    redirect_to dashboard_path
  end

  def message_error
    flash.now[:error] = 'You need friends. Add some! Seriously.'
    render :new
  end

  def message_fail(viewing_party)
    flash.now[:error] = viewing_party.errors.full_messages.to_sentence
    render :new
  end

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

  def attendees(viewing_party, params)
    friends(params).each do |friend_email|
      viewing_party.attendees.create!(friend_id: User.find_by(email: friend_email).id)
    end
  end
end
