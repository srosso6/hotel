require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")


class TestGuest < Minitest::Test

  def setup
    @guest_1 = Guest.new("Rupert", "Barley")
    @guest_2 = Guest.new("Georgina", "Barley")
  end


  def test_guest_has_name
    assert_equal("Rupert Barley", @guest_1.first_name + " " + @guest_1.last_name)
  end

  # def test_party_size
  #   assert_equal(2, @guest_1.party_size)
  # end

end