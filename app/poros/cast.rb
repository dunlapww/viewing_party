class Cast
  attr_reader :name, :character, :picture, :gender, :id
  def initialize(cast_members)
    binding.pry
    @name = cast_member[:name]
    @character = cast_member[:character]
    @picture = cast_member[:profile_path]
    @gender = cast_member[:gender] #this is a number and will need to be formatted
    @id = cast_member[:id]
  end

  # def name
  # end
  #
  # def character
  # end
  #
  # def picture
  # end
  #
  # def gender
  # end
  #
  # def id
  # end
end
