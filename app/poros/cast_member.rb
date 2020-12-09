class CastMember
  attr_reader :name, :character, :picture, :gender, :id
  def initialize(cast_member)
    @name = cast_member[:cast].first[:name]
    @character = cast_member[:cast].first[:character]
    @picture = cast_member[:cast].first[:profile_path]
    @gender = format_gender(cast_member[:cast].first[:gender]) #this is a number and will need to be formatted
    @id = cast_member[:cast].first[:id]
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
