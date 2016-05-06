class Hotel

  attr_accessor( :rooms )

  def initialize(rooms)
    @rooms = rooms
  end


  def check_in(room_number, guest)
    for room in @rooms
      if room.room_number == room_number && room.room_empty?
        room.change_availability
        room.guests << guest
      end
    end
  end

  def check_out(room_number, guest)
    for room in @rooms
      if room.room_number == room_number && !room.room_empty?
        room.change_availability
        room.guests.clear
      end
    end
  end

  def guests_currently_in_room(room)
    room.guests.each do |item|
      return "#{item.first_name} #{item.last_name}"
    end
  end

end



