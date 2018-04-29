require_relative("../models/customer")
require_relative("../models/film")
require_relative("../models/ticket")
require("minitest/autorun")
require("minitest/rg")

class CustomerTest < Minitest::Test

  def setup
    @customer1 = Customer.new({ "name" => "Anya Jenkins", "funds" => "6"})

    @film1 = Film.new({ "title" => "Avengers", "price" => "3"})

    @ticket1 = Ticket.new({ "customer_id" => @customer1.id, "film_id" => @film1.id})
  end

  def test_funds()
    assert_equal(6, @customer1.funds())
  end

  def test_pay_for_film()
    @customer1.buy_tickets(@film1)
    assert_equal(3, @customer1.funds())
  end

  # def test_number_of_tickets()
  #   @customer1.buy_tickets(@film1)
  #   assert_equal(1, @customer1.number_of_tickets())
  # end

end
