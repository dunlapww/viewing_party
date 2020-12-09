class MovieDetail
  attr_reader :title,
              :vote_average,
              :runtime,
              :poster,
              :uuid,
              :summary,
              :genres
  def initialize(movie_data)
    @title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @poster = movie_data[:poster_path]
    @uuid = movie_data[:id]
    @summary = movie_data[:overview]
    @genres = genre_names(movie_data[:genres])
  end

  private
  def genre_names(data)
    data.map do |genre|
      genre[:name]
    end
  end
end
