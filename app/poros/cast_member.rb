class CastMember
  attr_reader :name,
              :character,
              :picture,
              :gender,
              :id

  def initialize(cast_member)
    @name = cast_member[:name]
    @character = cast_member[:character]
    @picture = cast_member[:profile_path]
    @gender = format_gender(cast_member[:gender])
    @id = cast_member[:id]
  end

  def format_gender(info)
    if info == 1
      'female'
    elsif info == 2
      'male'
    else
      'n/a'
    end
  end
end
