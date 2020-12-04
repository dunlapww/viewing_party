class MovieService
  attr_reader :uuid, :data, :reviews, :cast
  def initialize(uuid)
    @uuid = uuid
    @data = parse_data(movie_data)
    @reviews = parse_data(review_data)
    @cast = parse_data(cast_data)
  end

  private
  def movie_data
    puts ENV.keys
    connection.get("/3/movie/#{@uuid}?api_key=#{ENV['MDB_API_KEY']}")
  end

  def review_data
    connection.get("/3/movie/#{@uuid}/reviews?api_key=#{ENV['MDB_API_KEY']}")
  end

  def cast_data
    connection.get("/3/movie/#{@uuid}/credits?api_key=#{ENV['MDB_API_KEY']}")
  end

  def connection
    Faraday.new("https://api.themoviedb.org")
  end

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  # def self.movie_details(uuid)
  #   response = conn.get("/3/movie/#{uuid}?api_key=#{ENV['MDB_API_KEY']}")
  #   JSON.parse(response.body, symbolize_names: true)
  # end
  #
  # def self.reviews(uuid)
  #   response = conn.get("/3/movie/#{uuid}?api_key=#{ENV['MDB_API_KEY']}")
  #   JSON.parse(response.body, symbolize_names: true)
  # end
  #
  # def self.movie_credits(uuid)
  #   response = conn.get("/3/movie/#{uuid}?api_key=#{ENV['MDB_API_KEY']}")
  #   JSON.parse(response.body, symbolize_names: true)
  # end
end
