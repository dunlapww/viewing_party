class SearchController < ApplicationController
  def new
    render file: 'public/404' unless current_user
  end

  def show
    render file: 'public/404' unless current_user
    if params[:search]
      @movies = SearchFacade.search(params[:search])
      @search = "'#{params[:search]}'"
    else
      @movies = SearchFacade.top_rated
    end
  end
end
