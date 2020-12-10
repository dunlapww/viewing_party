class SearchService
  def self.search(search_term)
    consolidate_results("keyword", search_term)
  end

  def self.top_forty
    consolidate_results("top")
  end

  private

  def self.connection
    Faraday.new('https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['MDB_API_KEY']
    end
  end

  def self.parse_data(page, type, search_term)
    if type == "keyword"
      response = keyword_search(search_term, page)
    else
      response = top_rated(page)
    end
    json_body = JSON.parse(response.body, symbolize_names: true)
    json_body[:results].nil? ? [] : json_body[:results]
  end

  def self.keyword_search(search_term, page)
    connection.get("/3/search/movie?query=#{search_term}&page=#{page}")
  end

  def self.top_rated(page)
    connection.get("/3/movie/top_rated?language=en-US&page=#{page}")
  end

  def self.consolidate_results(type, search_term = nil)
    results = parse_data(1, type, search_term)
    results << parse_data(2, type, search_term)
    results.flatten
  end
end
