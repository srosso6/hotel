class RoomService

  attr_accessor( :menu )

  def initialize(menu)
    @menu = menu
  end


  def price_of_menu_item(item)
    for hash in @menu
      if hash[:item] == item
        return hash[:price]
      end
    end
  end

  def apply_charge_to_room(items, room)
    items.each do |item| 
      room.room_service += price_of_menu_item(item)
    end
    return room.room_service
  end

  def undo_charge_to_room(items, room)
    items.each do |item| 
      room.room_service -= price_of_menu_item(item)
    end
    return room.room_service
  end

end