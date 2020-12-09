class MovieDetail
  attr_reader :title,
              :vote_average,
              :runtime,
              :description,
              :poster,
              :movie_id
  def initialize(movie_data)
    @title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @description = movie_data[:overview]
    @poster = movie_data[:poster_path]
    @movie_id = movie_data[:id]
  end
end
