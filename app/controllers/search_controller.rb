class SearchController < ApplicationController
  def new
  end

  def show
    if params[:search]
      @movie_details = SearchFacade.search(params[:search], 1)
    else
      @movie_details = SearchFacade.top_rated(1)
    end
  end
end
