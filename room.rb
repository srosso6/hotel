class Room

  attr_reader( :room_number, :available)
  attr_accessor( :guests )

  def initialize(room_number)
    @room_number = room_number
    # @room_type = room_type
    # @max_persons = max_persons
    @available = true
    @guests = []
  end

  def change_availability()
    return @available = !@available
  end

end