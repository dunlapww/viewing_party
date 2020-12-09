class MovieFacade
  def self.movie_details(uuid)
    details = {}
    details[:movie_data] = MovieService.movie_data(uuid)
    # return data is an arrray
    details[:cast_data] = MovieService.cast_data(uuid)
    details[:review_data] = MovieService.review_data(uuid)
    return details
  end

  # Movie.new(MovieService.movie_data(uuid)

  # cast poro
  # review poro
  # movie poro
end
