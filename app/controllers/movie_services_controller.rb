class MovieServicesController < ApplicationController

  def show
    @movie = MovieService.new(params[:uuid])
  end
end
