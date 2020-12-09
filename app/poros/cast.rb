class Cast
  attr_reader :name, :character, :picture, :gender, :id
  def initialize(cast_member)
    @name = cast_member[:name]
    @character = cast_member[:character]
    @picture = cast_member[:profile_path]
    @gender = cast_member[:gender] #this is a number and will need to be formatted
    @id = cast_member[:id]
  end

end
