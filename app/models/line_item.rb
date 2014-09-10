class LineItem < ActiveRecord::Base
  belongs_to :order, inverse_of: :line_items
  belongs_to :product

  before_save :set_price
  after_save :increment_order_total_amount

  validates :order, :product_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0, allow_blank: true }

  def set_price
    self.price = product.price
  end

  def total_price
    price * quantity
  end

  def increment_order_total_amount
    order.increment_total_amount(total_price)
  end
end


#WHAT I HAD BEFORE

#class LineItem < ActiveRecord::Base
 # belongs_to :order
  #belongs_to :product
#end

#CALLBACK (pg. 50 of Active Record slides
#http://pjb3.github.io/back-end-web-development/03_sql_models_routing_controllers/active_record#1)

# class LineItem < ActiveRecord::Base
#   belongs_to :order
#   belongs_to :product

#   before_validation :set_price
#   after_save :increment_order_total_amount

#   def set_price
#     self.price = product.price
#   end

#   def total_price
#     price * quantity
#   end

#   def increment_order_total_amount
#     order.increment_total_amount(total_price)
#   end

# end