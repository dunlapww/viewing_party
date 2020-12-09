class Review
  attr_reader :author,
              :content,
              :review_id,
              :url,
              :rating
  def initialize(data)
    @author = data[:author]
    @content = data[:content]
    @review_id = data[:id]
    @url = data[:url]
    @rating = data[:author_details][:rating]
  end
end
