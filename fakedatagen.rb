Customer.delete_all
CreditCard.delete_all
Product.delete_all
Order.delete_all
LineItem.delete_all

#extra credit progress bar
pbar = ProgressBar.new("Progress", 100)

50.times do
  Product.create!(name: Faker::Commerce.product_name, price: Faker::Commerce.price)
end
#100 x
100.times do
#Create customer with Fake name and Fake email
  customer = Customer.create!(name: Faker::Name.name, email: Faker::Internet.email)
  customer.credit_cards.create!(number: Faker::Business.credit_card_number, expires_on: Faker::Business.credit_card_expiry_date)
#between 1 and 5 times create a customer order(s)
  rand(1..5).times do
    order = customer.orders.create()
#between 1 and 5 times create a line item(s) for customer
    rand(1..5).times do
      line_item = order.line_items.create!(product_id: rand(1..50), quantity: rand(1..5))
    end
  end
  #extra credit progress bar increment
  pbar.inc
end
  #extra credit progress bar finish
pbar.finish

# Slide 12 @ http://pjb3.github.io/back-end-web-development/03_sql_models_routing_controllers/assignments#9

# Create a script that you can run with rails runner to generate
# 100 fake customers and a credit card for each customer.

# Make each customer place between 1 and 5 orders, with between 1 and 5 line items per order,
# with a quantity between 1 and 5 for each line item.

# Hint: use rand(4) + 1 to get a random between between 1 and 5.
# Hint: use the sample method on an Array to get a random element of an Array

# Extra Credit: Make sure the same product isn't used in
# multiple line items in the same order. Hint: use a combination of Array#delete_at and rand

# Extra Credit: Use the "progressbar" gem to print out the progress of your script as it runs.
