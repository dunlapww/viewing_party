class SearchFacade
  def self.top_rated
    results = SearchService.top_forty
    get_results(results)
  end

  def self.search(title)
    results = SearchService.search(title)
    get_results(results)
  end

  def self.get_results(results)
    results.map do |movie_detail|
      MovieDetail.new(movie_detail)
    end
  end
end
