class MovieFacade
  def self.movie_details(uuid)
    MovieDetail.new(MovieService.movie_data(uuid))
  end

  def self.cast_details(uuid)
    results =  MovieService.cast_data(uuid)
    results[:cast].map do |movie_detail|
      CastMember.new(movie_detail)
    end
  end

  def self.review_details(uuid)
    results =  MovieService.review_data(uuid)
    results[:results].map do |movie_detail|
      Review.new(movie_detail)
    end
  end
end
