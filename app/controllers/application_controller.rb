class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :film_length

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def film_length(minutes)
    hrs = (minutes / 60).to_s
    mins = (minutes % 60).to_s.rjust(2, '0')
    "#{hrs}:#{mins}"
  end
end
