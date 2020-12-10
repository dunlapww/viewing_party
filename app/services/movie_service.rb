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

  def self.reco_data(uuid)
    response = connection.get("/3/movie/#{uuid}/recommendations")
    parse_data(response)
  end

  def self.similar_data(uuid)
    response = connection.get("/3/movie/#{uuid}/similar")
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
end
