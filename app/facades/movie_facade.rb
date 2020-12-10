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
    require "pry"; binding.pry
    results[:cast].map do |cast_detail|
      CastMember.new(cast_detail)
    end
  end

  # def self.similiar_details(uuid)
  #   results =  MovieService.similiar_data(uuid)
  #   results[:cast].map do |cast_detail|
  #     CastMember.new(cast_detail)
  #   end
  # end
end
