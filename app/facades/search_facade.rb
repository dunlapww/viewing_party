class SearchFacade
  def self.top_rated(uuid)
    @json = MovieService.top_rated(uuid)
    parse
  end

  def self.search(title, page)
    @json = SearchService.search(title, page)
    parse
  end

  def self.parse
    @movie_details = @json.map do |movie_detail|
      if movie_detail[0] == :id
        return MovieDetail.new(movie_detail[1])
      end
    end
  end
end
