class ViewingPartiesController < ApplicationController

  def new
    @movie = MovieService.new(params[:uuid])
  end

end
