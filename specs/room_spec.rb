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

  def test_calculate_final_bill
    assert_equal(240,@room_1.calculate_final_bill(2))
    assert_equal(240,@room_2.calculate_final_bill(2))
    assert_equal(320,@room_3.calculate_final_bill(2))
    assert_equal(360,@room_4.calculate_final_bill(2))
    assert_equal(180,@room_5.calculate_final_bill(2))
    @room_1.room_service = 12
    assert_equal(252,@room_1.calculate_final_bill(2))
  end

  def test_discount_bill_by_value
    @room_1.bill = 7
    @room_1.discount_bill_by_value(7)
    assert_equal(0, @room_1.bill)
  end

  def test_discount_bill_by_percentage
    @room_1.bill = 120
    @room_1.discount_bill_by_percentage(25)
    assert_equal(90, @room_1.bill)
  end


end







