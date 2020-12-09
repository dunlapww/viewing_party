class SearchFacade
  def self.top_rated(page)
    results = MovieService.top_rated(page)
    results[:results].map do |movie_detail|
      MovieDetail.new(movie_detail)
    end
  end

  def self.search(title, page)
    results = SearchService.search(title, page)
    results.map do |movie_detail|
      MovieDetail.new(movie_detail)
    end
  end
end
