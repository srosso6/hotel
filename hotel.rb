class Hotel

  attr_accessor( :rooms )

  def initialize(rooms)
    @rooms = rooms
  end


  def room_exists_in_hotel?(room)
    @rooms.include?(room)
  end

  def check_in(room, guest)
    if !room_exists_in_hotel?(room)
      return :room_not_found
    end
    if !room.available
      return :room_already_booked
    end
    room.change_availability
    room.guests << guest
  end

  def check_out(room, guest)
    if !room_exists_in_hotel?(room)
      return :room_not_found
    end
    if room.available
      return :room_not_occupied
    end
    room.change_availability
    room.guests.clear
  end

  def guests_currently_in_room(room)
    room.guests.each do |item|
      return "#{item.first_name} #{item.last_name}"
    end
  end

  # def get_room_by_number()  try using block
  # end

  # def check_in_multiple_guests()

  # end

  #if two or more people arrive together and would like to share a room, then check them into a room of suitable size

end



