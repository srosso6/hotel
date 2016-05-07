require_relative("../room.rb")

class FamilyRoom < Room

  attr_reader( :max_persons )
  attr_accessor( :rate )

  def initialize(room_number)
    super(room_number)
    @max_persons = 4
    @rate = 180
  end

end