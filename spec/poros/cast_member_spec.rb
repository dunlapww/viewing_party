require 'rails_helper'

RSpec.describe CastMember do
  it 'exists' do
      member = {
                  "adult": false,
                  "gender": 2,
                  "id": 819,
                  "known_for_department": "Acting",
                  "name": "Edward Norton",
                  "original_name": "Edward Norton",
                  "popularity": 7.96,
                  "profile_path": "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg",
                  "cast_id": 4,
                  "character": "The Narrator",
                  "credit_id": "52fe4250c3a36847f80149f3",
                  "order": 0
                }
      cast_member = CastMember.new(member)
      expect(cast_member).to be_a CastMember
      expect(cast_member.name).to eq('Edward Norton')
      expect(cast_member.character).to eq('The Narrator')
      expect(cast_member.picture).to eq('/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg')
      expect(cast_member.gender).to eq('male')
      expect(cast_member.id).to eq(819)
  end
end
