require("minitest/autorun")
require("minitest/rg")
require_relative("../room_service.rb")
require_relative("../room.rb")
require_relative("../rooms/twin_room.rb")

class TestRoomService < Minitest::Test

  def setup
    @room_1 = TwinRoom.new(1)

    menu = [
      {item: "whiskey", price: 4},
      {item: "hot chocolate", price: 2},
      {item: "water", price: 1},
      {item: "burger_and_chips", price: 7},
      {item: "carrot_cake", price: 2}
    ]

    @room_service = RoomService.new(menu)
  end

  def test_price_of_menu_item
    assert_equal(4, @room_service.price_of_menu_item("whiskey"))
  end

  def test_apply_charge_to_room
    @room_service.apply_charge_to_room(["water", "burger_and_chips"], @room_1)
    assert_equal(8, @room_1.room_service)
  end

  def test_undo_charge_to_room
    @room_service.apply_charge_to_room(["water", "burger_and_chips"], @room_1)
    @room_service.undo_charge_to_room(["water", "burger_and_chips"], @room_1)
    assert_equal(0, @room_1.room_service)
  end

end


