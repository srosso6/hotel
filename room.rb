class Room

  attr_reader( :number, :available )
  attr_accessor( :guests, :room_service)

  def initialize(room_number)
    @number = room_number
    @available = true
    @guests = []
    @max_persons = nil
    @rate = nil
    @room_service = 0
    @bill = 0
  end

  def change_availability()
    return @available = !@available
  end

  def calculate_final_bill(num_nights)
    @bill = @rate * num_nights
    @bill += @room_service
    return @bill
  end

  def discount_bill_by_value(discount_value)
    return @bill -= discount_value
  end

  def discount_bill_by_percentage(discount_percent)
    return @bill -= @bill * (discount_percent / 100.0)
  end

end