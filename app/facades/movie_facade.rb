class MovieFacade
  def self.movie_data(uuid)
    json = MovieService.movie_data
    details = {}
    details[:movie_data] = MovieService.movie_data(uuid)
    details[:cast_data] = MovieService.cast_data(uuid)
    details[:review_data] = MovieService.review_data(uuid)
  end

  def self.review_data
  end

  def self.cast_data
  end
end
