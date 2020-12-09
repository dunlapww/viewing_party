require 'rails_helper'

RSpec.describe Cast do
  it 'exists' do
    VCR.use_cassette('cast_member_exists') do
      # cast_memeber{
      #   :cast_id => ,
      #   :character => ,
      #   :gender => ,
      #   :name => ,
      #   :profile_path =>
      #  }
      # cast = Cast.new(cast_member)
    end
  end
end
