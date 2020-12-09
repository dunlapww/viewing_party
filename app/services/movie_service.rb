class MovieService
  def self.movie_data(uuid)
    response = connection.get("/3/movie/#{uuid}")
    parse_data(response)
  end

  def self.review_data(uuid)
    response = connection.get("/3/movie/#{uuid}/reviews")
    parse_data(response)
  end

  def self.cast_data(uuid)
    response = connection.get("/3/movie/#{uuid}/credits")
    parse_data(response)
  end

  def self.top_rated
    response = connection.get("/3/movie/top_rated?api_key=#{ENV['MDB_API_KEY']}&language=en-US&page=1")
    parse_data(response)
  end

  def self.connection
    Faraday.new('https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['MDB_API_KEY']
    end
  end

  def self.parse_data(response)
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
