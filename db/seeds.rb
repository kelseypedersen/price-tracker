require 'faker'

products = [480234994, 481587986]

3.times do
  user = User.create(name: Faker::Name.first_name, password: Faker::Internet.password(6), email: Faker::Internet.email, phone_number: "4157704113")
  product = Product.create(shopstyle_id: products[rand(0..1)])
end

2.times do
  want = Want.create(user_id: 2, product_id: 481587986, max_price: 10000, expiration: Faker::Date.forward(23))
end

2.times do
  want = Want.create(user_id: 3, product_id: 480234994, max_price: 1, expiration: Faker::Date.forward(23))
end

