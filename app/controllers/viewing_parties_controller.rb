class ViewingPartiesController < ApplicationController

  def new
    # binding.pry
    @movie = MovieService.new(params[:uuid])
  end

  def create
    friends = params.select do |k, v|
      v == '1'
    end.keys

  end
end
