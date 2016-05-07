require_relative("../room.rb")

class TwinRoom < Room

  attr_reader( :max_persons )
  attr_accessor( :rate )

  def initialize(room_number)
    super(room_number)
    @max_persons = 2
    @rate = 120
    @sofabed = false
  end


  def sofabed()
    return @sofabed = !@sofabed
  end

  def max_persons()
    @sofabed ? @max_persons + 1 : @max_persons
  end

end