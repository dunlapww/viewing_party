class SearchService
  def self.search(search_terms, page)
    parse_data(search_terms, page)
  end

  def self.connection
    Faraday.new('https://api.themoviedb.org')
  end

  def self.parse_data(search_terms, page)
    json_body = JSON.parse(keyword_search(search_terms, page).body, symbolize_names: true)
    json_body[:results]
  end

  def self.keyword_search(search_terms, page)
    connection.get("/3/search/movie?api_key=#{ENV['MDB_API_KEY']}&query=#{search_terms}&page=#{page}")
  end

  def self.consolidate_results(search_terms)
    results = parse_data(search_terms, 1)
    results << parse_data(search_terms, 2)
    results.flatten
  end
end
