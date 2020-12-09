class MovieDetailsController < ApplicationController
  def show
    @movie_detail = MovieFacade.movie_details(params[:uuid])
    @cast = MovieFacade.cast_details(params[:uuid])
    @reviews = MovieFacade.review_details(params[:uuid])
  end
end
