class Guest

  attr_reader( :first_name, :last_name )
  attr_accessor(  )

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    # @party_size = party_size
  end

end