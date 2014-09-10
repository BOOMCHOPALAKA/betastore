require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def test_save_success
    order = customers(:paul).orders.build(
      credit_card: credit_cards(:paul_visa))
    assert order.save,
      order.errors.full_messages.join(', ')
  end

  def test_save_no_credit_card
    order = customers(:paul).orders.build
    refute order.save
    assert_equal ["can't be blank"],
      order.errors[:credit_card_id]
  end

end
#WHAT I HAD BEFORE


# require 'test_helper'

# class OrderTest < ActiveSupport::TestCase

# #to make a test method... it must always start with test_
# #usual naming convention is test_whatever_method_you_are_testing
#   # def test_create
#   #   order = Order.new
#   #   assert order.save
#   # end

#   def test_total_revenue
#     assert_equal 42, Order.total_revenue
#   end

#   # test "the truth" do
#   #   assert true
#   # end
# end
