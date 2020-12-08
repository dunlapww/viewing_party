class TopMovieSet
  attr_reader :results
  def initialize
    @results = consolidate_results
  end

  private

  def consolidate_results
    results = parse_data(1)
    results << parse_data(2)
    results.flatten
  end
  def connection
    Faraday.new("https://api.themoviedb.org")
  end
  
  def keyword_search(page)
    connection.get("/3/movie/top_rated?api_key=#{ENV['MDB_API_KEY']}&page=#{page}")
  end

  def parse_data(page)
    json_body = JSON.parse(keyword_search(page).body, symbolize_names: true)
    json_body[:results]
  end
end