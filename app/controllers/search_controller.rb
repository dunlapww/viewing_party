class SearchController < ApplicationController
  def new
    render file: 'public/404' unless current_user
  end

  def show
    render file: 'public/404' unless current_user
    if params[:search]
      @movies = MovieSearch.new(params[:search])
    else
      @movies = TopMovieSet.new
    end
  end
end
