class SearchController < ApplicationController
  def new
  end
  
  def show
    if params[:search]
      @movies = MovieSearch.new(params[:search])
      @search = params[:search]
    else
      @movies = TopMovieSet.new
      @search = nil
    end
  end
end
