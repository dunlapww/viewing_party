class MovieDetailsController < ApplicationController
  def show
    render file: 'public/404' unless current_user
    @movie_detail = MovieFacade.movie_details(params[:uuid])
    @cast = MovieFacade.cast_details(params[:uuid])
    @reviews = MovieFacade.review_details(params[:uuid])
    @recos = MovieFacade.reco_details(params[:uuid])
    @similar = MovieFacade.similar_details(params[:uuid])
  end
end
