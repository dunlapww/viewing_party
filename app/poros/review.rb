class Review
  attr_reader :author,
              :content,
              :rating

  def initialize(data)
    @author = data[:author]
    @content = data[:content]
    @rating = data[:author_details][:rating]
  end
end
