Customer.delete_all
CreditCard.delete_all

product_ids = Product.pluck(:id)

25.times do
  customer = Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email)
  puts "created customer #{customer.name}"
  cc = customer.credit_cards.create!(
    number: Faker::Business.credit_card_number)
  puts "created cc #{cc.number}"

  (rand(5) + 1).times do
    order = customer.orders.create!
    puts "Placed order #{order.id}"
    (rand(5) + 1).times do
      pids = product_ids.dup
     li = order.line_items.create!(product_id: pids.shuffle!.pop,
                              quantity: rand(5) + 1)
      puts li.inspect
    end
    #SEE PG. 10 on assignments slides http://pjb3.github.io/back-end-web-development/03_sql_models_routing_controllers/assignments#1
  #order.calculate_total_amount
 # order.save!

 # line_item.increment_order_total_amount

  end
end