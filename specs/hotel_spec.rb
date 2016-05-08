require("minitest/autorun")
require("minitest/rg")
require_relative("../hotel.rb")
require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../rooms/single_room.rb")
require_relative("../rooms/twin_room.rb")
require_relative("../rooms/double_room.rb")
require_relative("../rooms/triple_room.rb")
require_relative("../rooms/family_room.rb")
require_relative("../room_service.rb")


class TestHotel < Minitest::Test

  def setup
    @guest_1 = Guest.new("Rupert", "Barley")
    @guest_2 = Guest.new("Georgina", "Barley")
    @guest_3 = Guest.new("Rodney", "Sharp")

    @room_1 = TwinRoom.new(1)
    @room_2 = DoubleRoom.new(2)
    @room_3 = TripleRoom.new(3)
    @room_4 = FamilyRoom.new(4)
    @room_5 = SingleRoom.new(5)
    @room_6 = DoubleRoom.new(6)
    @room_7 = TwinRoom.new(7)
    @room_8 = FamilyRoom.new(8)
    @room_9 = SingleRoom.new(9)

    rooms = [ @room_1, @room_2, @room_3, @room_4, @room_5, @room_6, @room_7, @room_8, @room_9 ]

    @hotel_1 = Hotel.new(rooms)

    menu = { whiskey: 4, hot_chocolate: 2, water: 1, burger_and_chips: 7, carrot_cake: 2 }
    @room_service = RoomService.new(menu)

  end
  

  def test_number_rooms_in_hotel
    assert_equal(9, @hotel_1.rooms.count)
  end

  def test_room_exists_in_hotel?
    assert_equal(true, @hotel_1.room_exists_in_hotel?( @room_1 ))
    assert_equal(false, @hotel_1.room_exists_in_hotel?( @room_10 ))
  end

  def test_get_room_by_number
    assert_equal(@room_2, @hotel_1.get_room_by_number(2))
    assert_equal(:room_not_found, @hotel_1.get_room_by_number(10))
  end

  def test_check_in
    assert_equal(:room_not_found, @hotel_1.check_in(@room_10, [@guest_2]))

    @hotel_1.check_in(@room_1, [@guest_1, @guest_2])
    assert_equal(false, @room_1.available)
    assert_equal([@guest_1, @guest_2], @room_1.guests)

    @hotel_1.check_in(@room_2, [@guest_3])
    assert_equal(false, @room_2.available)
    assert_equal([@guest_3], @room_2.guests)

    assert_equal(:room_already_booked, @hotel_1.check_in(@room_2, [@guest_4]))
  end 

  def test_check_out
    assert_equal(:room_not_found, @hotel_1.check_out(@room_10, [@guest_2]))

    assert_equal(:room_not_occupied, @hotel_1.check_out(@room_1, [@guest_2]))

    @hotel_1.check_in(@room_1, [@guest_1])
    @hotel_1.check_out(@room_1, [@guest_1])

    assert_equal(true, @room_1.available)
    assert_equal(nil, @room_1.guests[0])

    @hotel_1.check_in(@room_2, [@guest_2])
    @hotel_1.check_out(@room_2, [@guest_2])
    assert_equal(true, @room_2.available)
    assert_equal(nil, @room_2.guests[0])

    @hotel_1.check_in(@room_1, [@guest_1])
    assert_equal(:guests_not_in_room, @hotel_1.check_out(@room_1, [@guest_2]))
  end 

  def test_find_room_for_party_size
    assert_equal([@room_5, @room_9], @hotel_1.find_room_for_party_size(1))
    assert_equal([@room_1, @room_2, @room_6, @room_7], @hotel_1.find_room_for_party_size(2))
    assert_equal([@room_3], @hotel_1.find_room_for_party_size(3))
    assert_equal([@room_4, @room_8], @hotel_1.find_room_for_party_size(4))
    @room_1.sofabed()
    assert_equal([@room_1, @room_3], @hotel_1.find_room_for_party_size(3))
  end

end









