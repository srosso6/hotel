require("minitest/autorun")
require("minitest/rg")
require_relative("../hotel.rb")
require_relative("../guest.rb")
require_relative("../room.rb")


class TestHotel < Minitest::Test

  def setup
    @guest_1 = Guest.new("Rupert", "Barley")
    @guest_2 = Guest.new("Georgina", "Barley")

    @room_1 = Room.new(1)
    @room_2 = Room.new(2)
    @room_3 = Room.new(3)

    rooms = [ @room_1, @room_2, @room_3]

    @hotel_1 = Hotel.new(rooms)
  end

  def test_number_rooms_in_hotel()
    assert_equal(3, @hotel_1.rooms.count)
  end

  def test_check_in
    @hotel_1.check_in(1, @guest_1)
    assert_equal(false, @room_1.room_empty?)
    assert_equal(@guest_1, @room_1.guests[0])
    @hotel_1.check_in(2, @guest_2)
    assert_equal(false, @room_2.room_empty?)
    assert_equal(@guest_2, @room_2.guests[0])
  end 

  def test_check_out
    @hotel_1.check_in(1, @guest_1)
    @hotel_1.check_out(1, @guest_1)
    assert_equal(true, @room_1.room_empty?)
    assert_equal(nil, @room_1.guests[0])
    @hotel_1.check_in(2, @guest_2)
    @hotel_1.check_out(2, @guest_2)
    assert_equal(true, @room_2.room_empty?)
    assert_equal(nil, @room_2.guests[0])
  end 

  def test_guests_currently_in_room()
    @hotel_1.check_in(1, @guest_1)
    assert_equal("Rupert Barley", @hotel_1.guests_currently_in_room(@room_1))
  end

end









