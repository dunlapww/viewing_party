class MovieSearch
  attr_reader :results
  def initialize(search_terms)
    @results = consolidate_results(search_terms)
  end


  def count
    @results.count
  end
  private

  def consolidate_results(search_terms)
    results = parse_data(search_terms, 1)
    results << parse_data(search_terms, 2)
    results.flatten
  end

  def connection
    Faraday.new('https://api.themoviedb.org')
  end

  def keyword_search(search_terms, page)
    connection.get("/3/search/movie?api_key=#{ENV['MDB_API_KEY']}&query=#{search_terms}&page=#{page}")
  end

  def parse_data(search_terms, page)
    json_body = JSON.parse(keyword_search(search_terms, page).body, symbolize_names: true)
    json_body[:results].nil? ? [] : json_body[:results]
  end
end
