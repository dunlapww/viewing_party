class MovieDetail
  attr_reader :uuid#, :data, :reviews, :cast
  def initialize(uuid)
    @uuid = uuid
    # binding.pry
    # @data = parse_data(movie_data)
    # @reviews = parse_data(review_data)
    # @cast = parse_data(cast_data)
  end
end
