require 'faker'

products = [455813874, 480234994]

10.times do
  user = User.create(name: Faker::Name.first_name, password: Faker::Internet.password(6), email: Faker::Internet.email, phone_number: "4147704113")
  product = Product.create(shopstyle_id: products[rand(0..1)])
end

2.times do
    want = Want.create(user_id: user.id, product_id: 455813874, max_price: rand(50..100), expiration: Faker::Date.forward(23))
end





