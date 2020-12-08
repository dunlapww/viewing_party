class MovieServicesController < ApplicationController

  def show
    render file: 'public/404' unless current_user
    @movie = MovieService.new(params[:uuid])
  end
end
