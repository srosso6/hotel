require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../rooms/single_room.rb")
require_relative("../rooms/twin_room.rb")
require_relative("../rooms/double_room.rb")
require_relative("../rooms/triple_room.rb")
require_relative("../rooms/family_room.rb")


class TestRoom < Minitest::Test

  def setup
    @room_1 = TwinRoom.new(1)
    @room_2 = DoubleRoom.new(2)
    @room_3 = TripleRoom.new(3)
    @room_4 = FamilyRoom.new(4)
    @room_5 = SingleRoom.new(5)
  end


  def test_room_number
    assert_equal(1, @room_1.number)
    assert_equal(2, @room_2.number)
    assert_equal(3, @room_3.number)
    assert_equal(4, @room_4.number)
    assert_equal(5, @room_5.number)
  end

  def test_no_guests_at_start
    assert_equal([], @room_1.guests)
    assert_equal([], @room_2.guests)
    assert_equal([], @room_3.guests)
    assert_equal([], @room_4.guests)
    assert_equal([], @room_5.guests)
  end

  def test_room_available?
    assert_equal(true, @room_1.available)
    assert_equal(true, @room_2.available)
    assert_equal(true, @room_3.available)
    assert_equal(true, @room_4.available)
    assert_equal(true, @room_5.available)
  end

  def test_change_availability
    @room_1.change_availability
    assert_equal(false, @room_1.available)

    @room_2.change_availability
    assert_equal(false, @room_2.available)

    @room_3.change_availability
    assert_equal(false, @room_3.available)

    @room_4.change_availability
    assert_equal(false, @room_4.available)

    @room_5.change_availability
    assert_equal(false, @room_5.available)
  end

  def test_max_persons()
    assert_equal(2, @room_1.max_persons)
    assert_equal(2, @room_2.max_persons)
    assert_equal(3, @room_3.max_persons)
    assert_equal(4, @room_4.max_persons)
    assert_equal(1, @room_5.max_persons)
  end

  def test_max_persons_with_sofabed()
    @room_1.sofabed()
    assert_equal(3, @room_1.max_persons)
  end


end







