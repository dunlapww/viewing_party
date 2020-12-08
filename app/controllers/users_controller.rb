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
    @user = current_user
  end

  def addfriend
    user = current_user
    friend = User.find_by(email: params['friend_email'])
    if !friend.nil?
      Friendship.create!(user_id: user.id, friend_id: friend.id)
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
