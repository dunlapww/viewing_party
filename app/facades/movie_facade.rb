class MovieFacade
  def self.movie_details(uuid)
    MovieDetail.new(MovieService.movie_data(uuid))
  end

  def self.cast_details(uuid)
    results =  MovieService.cast_data(uuid)
    results[:cast].map do |cast_detail|
      CastMember.new(cast_detail)
    end
  end

  def self.review_details(uuid)
    results =  MovieService.review_data(uuid)
    results[:results].map do |review_detail|
      Review.new(review_detail)
    end
  end

  def self.reco_details(uuid)
    results =  MovieService.reco_data(uuid)
    results[:results].map do |reco|
      MovieDetail.new(reco)
    end
  end

  def self.similar_details(uuid)
    results =  MovieService.similar_data(uuid)
    results[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end
end
