require 'rails_helper'

RSpec.describe Review do
  it 'exists' do
      review ={
                  "author": "Goddard",
                  "author_details": {
                      "name": "",
                      "username": "Goddard",
                      "avatar_path": "/https://secure.gravatar.com/avatar/f248ec34f953bc62cafcbdd81fddd6b6.jpg",
                      "rating": nil
                  },
                  "content": "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.",
                  "created_at": "2018-06-09T17:51:53.359Z",
                  "id": "5b1c13b9c3a36848f2026384",
                  "updated_at": "2018-06-11T02:40:47.833Z",
                  "url": "https://www.themoviedb.org/review/5b1c13b9c3a36848f2026384"
                }
      first_review = Review.new(review)
      expect(first_review).to be_a Review
      expect(first_review.author).to eq('Goddard')
      expect(first_review.content).to eq('Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.')
  end
end
