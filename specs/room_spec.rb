require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")


class TestRoom < Minitest::Test

  def setup
    @room_1 = Room.new(1)
    @room_2 = Room.new(2)
    @room_3 = Room.new(3)
    @room_4 = Room.new(4)
  end


  def test_room_number
    assert_equal(1, @room_1.room_number)
  end

  def test_no_guests_at_start
    assert_equal([], @room_1.guests)
  end

  # def test_room_type
  #   assert_equal("single", @room_1.room_type)
  # end

  def test_room_empty?
    assert_equal(true, @room_1.available)
  end

  def test_change_availability
    @room_1.change_availability
    assert_equal(false, @room_1.available)
  end

end