class Hotel

  attr_accessor( :rooms )

  def initialize(rooms)
    @rooms = rooms
  end


  def room_exists_in_hotel?(room)
    return @rooms.include?(room)
  end

  def get_room_by_number(num)
    array = @rooms.select { |room| room.number == num }
    if array == []
      return :room_not_found
    end
    return array.first
  end

  def check_in(room, guests)
    if !room_exists_in_hotel?(room)
      return :room_not_found
    end
    if !room.available
      return :room_already_booked
    end
    room.change_availability()
    room.guests << guests
    room.guests.flatten!
  end

  def check_out(room, guests)
    if !room_exists_in_hotel?(room)
      return :room_not_found
    end
    if room.available
      return :room_not_occupied
    end
    if room.guests != guests
      return :guests_not_in_room
    end
    room.change_availability()
    room.guests.clear
  end

  def find_room_for_party_size(party_size)
    suitable_rooms = []
    @rooms.each do |room|
      if room.max_persons == party_size
        suitable_rooms << room
      end
    end
    return suitable_rooms
  end

  def guests_in_hotel()
    guests = []
    @rooms.each do
  end

  # group bookings
  # sea view or garden view
  # standard or deluxe

end



