# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

beverages = Category.find_or_create_by(name: 'Beverages')
sandwiches = Category.find_or_create_by(name: 'Sandwiches')
burgers = Category.find_or_create_by(name: 'Burgers')
pizzas = Category.find_or_create_by(name: 'Pizzas')
drinks = Category.find_or_create_by(name: 'Soft Drinks')

coffee = Item.find_or_create_by(name: 'Coffee', category_id: beverages.id, price: 1.75, tax_rate: 9.5)
tea = Item.find_or_create_by(name: 'Tea', category_id: beverages.id, price: 1.25, tax_rate: 9.25)
green_tea = Item.find_or_create_by(name: 'Green Tea', category_id: beverages.id, price: 1.05, tax_rate: 8.75)

club_sandwich = Item.find_or_create_by(name: 'Club Sandwich', category_id: sandwiches.id, price: 7.25, tax_rate: 8.45)
bacon_sandwich = Item.find_or_create_by(name: 'Bacon Sandwich', category_id: sandwiches.id, price: 8.25, tax_rate: 9.23)

chicken_burger = Item.find_or_create_by(name: 'Chicken Burger', category_id: burgers.id, price: 10.21, tax_rate: 10.47)
beef_burger = Item.find_or_create_by(name: 'Beef Burger', category_id: burgers.id, price: 11.21, tax_rate: 10.77)

veg_pizza = Item.find_or_create_by(name: 'Veg Pizza', category_id: pizzas.id, price: 13.11, tax_rate: 10.12)
non_veg_pizza = Item.find_or_create_by(name: 'Non Veg Pizza', category_id: pizzas.id, price: 15.15, tax_rate: 10.53)

coke = Item.find_or_create_by(name: 'Coke', category_id: drinks.id, price: 1.00, tax_rate: 9.00)
pepsi = Item.find_or_create_by(name: 'Pepsi', category_id: drinks.id, price: 1.00, tax_rate: 9.00)
fanta = Item.find_or_create_by(name: 'Fanta', category_id: drinks.id, price: 1.10, tax_rate: 9.10)

burger_combo = Offer.find_or_create_by(name: 'Burger Coke Combo', start_date: Time.now, end_date: Time.now + 1.year, priority_order: 1)
sandwich_combo = Offer.find_or_create_by(name: 'Sandwich Pepsi Combo', start_date: Time.now, end_date: Time.now + 1.year, priority_order: 2)
pizza_combo = Offer.find_or_create_by(name: 'Pizza Fanta Combo', start_date: Time.now, end_date: Time.now + 1.year, priority_order: 3)

OfferItem.find_or_create_by(offer_id: burger_combo.id, item_id: beef_burger.id, discount_rate: 0)
OfferItem.find_or_create_by(offer_id: burger_combo.id, item_id: coke.id, discount_rate: 50)

OfferItem.find_or_create_by(offer_id: sandwich_combo.id, item_id: bacon_sandwich.id, discount_rate: 0)
OfferItem.find_or_create_by(offer_id: sandwich_combo.id, item_id: pepsi.id, discount_rate: 70)

OfferItem.find_or_create_by(offer_id: pizza_combo.id, item_id: non_veg_pizza.id, discount_rate: 0)
OfferItem.find_or_create_by(offer_id: pizza_combo.id, item_id: fanta.id, discount_rate: 100)



