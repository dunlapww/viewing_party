class MovieFacade
  def self.movie_details(uuid)
    details = {}
    details[:movie_data] = MovieService.movie_data(uuid)
    details[:cast_data] = MovieService.cast_data(uuid)
    details[:review_data] = MovieService.review_data(uuid)
    # binding.pry
    return details
  end
end
