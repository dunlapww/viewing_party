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
    # binding.pry
    # movie_details = @json.map do |movie_detail|
    #   if movie_detail[0] == :id
    #     return MovieDetail.new(movie_detail[1])
    #   end
    # end
    MovieDetail.new(@json)
  end
end
