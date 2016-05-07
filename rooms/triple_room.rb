require_relative("../room.rb")

class TripleRoom < Room

  attr_reader( :max_persons )
  attr_accessor( :rate )

  def initialize(room_number)
    super(room_number)
    @max_persons = 3
    @rate = 160
  end

end