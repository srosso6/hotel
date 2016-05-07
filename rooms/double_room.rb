require_relative("../room.rb")

class DoubleRoom < Room

  attr_reader( :max_persons )
  attr_accessor( :rate )

  def initialize(room_number)
    super(room_number)
    @max_persons = 2
    @rate = 120
  end

end