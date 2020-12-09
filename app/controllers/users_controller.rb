class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = user.errors.full_messages.to_sentence
      user.email = nil if User.find_by(email: user.email)
      render :new
    end
  end

  def show
    render file: 'public/404' unless current_user
    @user = current_user
  end

  def addfriend
    friend = User.find_by(email: params['friend_email'])
    if !friend.nil? && Friendship.exists?(friend.id, current_user.id) || current_user == friend
      flash[:notice] = "You are already friends!"
      redirect_to dashboard_path
    elsif !friend.nil?
      Friendship.create!(user_id: current_user.id, friend_id: friend.id)
      redirect_to dashboard_path
    else
      flash[:error] = "Your friend isn't here yet! Tell them!"
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
end
