class SearchController < ApplicationController
  def new
  end
  
  def show
    if params[:search]
      @movies = MovieSearch.new(params[:search])
      @search = "'#{params[:search]}'"
    else
      @movies = TopMovieSet.new
    end
  end
end
