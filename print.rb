class Print

  def print_guests_in_room(room)
    puts "#{room.number}: "
    if room.available
      puts "Room not occupied"
    end
    room.guests.each { |guest| puts guest.join_names() }
  end

  def print_hotel(hotel_1)
    hotel_1.rooms.each { |room| print_guests_in_room(room) }
  end

end