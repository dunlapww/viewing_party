class MovieFacade
  def self.movie_details(uuid)
    Movie.new(MovieService.movie_data(uuid))
  end

  def self.cast_details(uuid)
    # this is a hash. with [:id] as the 550 and [:cast] is an array of hashes
    # Cast.new(MovieService.cast_data(uuid)
    CastMember.new(MovieService.cast_data(uuid)
  end

  def self.review_details(uuid)
    # this is a hash. with [:id] as the 550 and [:result] is an array of hashes
    Review.new(MovieService.review_data(uuid)
  end
end
