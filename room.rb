class Room

  attr_reader( :number, :available )
  attr_accessor( :guests )

  def initialize(room_number)
    @number = room_number
    @max_persons = nil
    @available = true
    @guests = []
  end

  def change_availability()
    return @available = !@available
  end

end