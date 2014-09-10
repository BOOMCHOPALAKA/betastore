# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clothing      = Category.create!(name: 'Clothing')
accessories   = Category.create!(name: 'Accessories')
miscellaneous = Category.create!(name: 'Miscellaneous')

hat         = Product.create!(name: 'Hat', price: 11.99, image_url:'/images/products/hat.jpg', categories:[clothing, accessories])
hoodie      = Product.create!(name: 'Hoodie', price: 39.99, image_url:'/images/products/hoodie.jpg', categories: [clothing])
iphone_case = Product.create!(name: 'Iphone Case', price: 14.99, image_url:'/images/products/iphone_case.jpg', categories: [accessories])
journal     = Product.create!(name: 'Journal', price: 4.99, image_url:'/images/products/journal.jpg', categories: [miscellaneous])
shirt       = Product.create!(name: 'Shirt', price: 19.99, image_url:'/images/products/shirt.jpg', categories: [clothing])
sticker     = Product.create!(name: 'Sticker', price: 2.99, image_url:'/images/products/sticker.jpg', categories: [miscellaneous])

me = Customer.create!(name: 'Dom', email: 'dmonaco05@hotmail.com')
me.credit_cards.create(card_number: '1234567812345678', expiration_date: '05/15')

User.create!(email: 'moopuna@gmail.com', password: 'turtle1431')