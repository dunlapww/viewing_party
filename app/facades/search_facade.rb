class SearchFacade
  def self.top_rated(page)
    @json = MovieService.top_rated(page)
    parse
  end

  def self.search(title, page)
    @json = SearchService.search(title, page)
    parse
  end

  def self.parse
    @json[:results].map do |movie_detail|
        MovieDetail.new(movie_detail)
    end
  end
end
