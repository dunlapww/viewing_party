require 'rails_helper'

RSpec.describe MovieDetail do
  it 'exists' do
    movie_data = {
        "adult": false,
        "backdrop_path": "/rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg",
        "belongs_to_collection": nil,
        "budget": 63000000,
        "genres": [
            {
                "id": 18,
                "name": "Drama"
            }
        ],
        "homepage": "http://www.foxmovies.com/movies/fight-club",
        "id": 550,
        "imdb_id": "tt0137523",
        "original_language": "en",
        "original_title": "Fight Club",
        "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
        "popularity": 36.401,
        "poster_path": "/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg",
        "production_companies": [
            {
                "id": 508,
                "logo_path": "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png",
                "name": "Regency Enterprises",
                "origin_country": "US"
            },
            {
                "id": 711,
                "logo_path": "/tEiIH5QesdheJmDAqQwvtN60727.png",
                "name": "Fox 2000 Pictures",
                "origin_country": "US"
            },
            {
                "id": 20555,
                "logo_path": "/hD8yEGUBlHOcfHYbujp71vD8gZp.png",
                "name": "Taurus Film",
                "origin_country": "DE"
            },
            {
                "id": 54051,
                "logo_path": nil,
                "name": "Atman Entertainment",
                "origin_country": ""
            },
            {
                "id": 54052,
                "logo_path": nil,
                "name": "Knickerbocker Films",
                "origin_country": "US"
            },
            {
                "id": 25,
                "logo_path": "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
                "name": "20th Century Fox",
                "origin_country": "US"
            },
            {
                "id": 4700,
                "logo_path": "/A32wmjrs9Psf4zw0uaixF0GXfxq.png",
                "name": "The Linson Company",
                "origin_country": ""
            }
        ],
        "production_countries": [
            {
                "iso_3166_1": "DE",
                "name": "Germany"
            },
            {
                "iso_3166_1": "US",
                "name": "United States of America"
            }
        ],
        "release_date": "1999-10-15",
        "revenue": 100853753,
        "runtime": 139,
        "spoken_languages": [
            {
                "english_name": "English",
                "iso_639_1": "en",
                "name": "English"
            }
        ],
        "status": "Released",
        "tagline": "Mischief. Mayhem. Soap.",
        "title": "Fight Club",
        "video": false,
        "vote_average": 8.4,
        "vote_count": 20543
    }
    movie_detail = MovieDetail.new(movie_data)

    expect(movie_detail).to be_a MovieDetail
    expect(movie_detail.title).to eq('Fight Club')
    expect(movie_detail.vote_average).to eq(8.4)
    expect(movie_detail.runtime).to eq(139)
    description = "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."
    expect(movie_detail.description).to eq(description)
    expect(movie_detail.movie_id).to eq(550)
    expect(movie_detail.poster).to eq('/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg')
  end
end
