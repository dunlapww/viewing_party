class MovieDetailsController < ApplicationController
  def show
    @movie = MovieFacade.movie_details(params[:uuid])
    # binding.pry
  end
end
