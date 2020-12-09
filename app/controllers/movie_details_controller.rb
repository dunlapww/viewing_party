class MovieDetailsController < ApplicationController
  def show
    @movie_detail = MovieFacade.movie_details(params[:uuid])
    # binding.pry
  end
end
