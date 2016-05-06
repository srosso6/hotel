class Room

  attr_reader( :room_number )
  attr_accessor( :guests )

  def initialize(room_number)
    @room_number = room_number
    @available = true
    @guests = []
  end


  def room_empty?()
    return @available
  end

  def change_availability()
    return @available = !@available
  end

end