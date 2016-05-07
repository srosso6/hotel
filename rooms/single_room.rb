require_relative("../room.rb")

class SingleRoom < Room

  attr_reader( :max_persons )
  attr_accessor( :rate )

  def initialize(room_number)
    super(room_number)
    @max_persons = 1
    @rate = 90
  end

end