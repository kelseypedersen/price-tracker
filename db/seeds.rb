require 'faker'

products = [455813874, 455813875]

10.times do
  user = User.create(name: Faker::Name.first_name, password: Faker::Internet.password(6), email: Faker::Internet.email)
  product = Product.create(shopstyle_id: products[rand(0..1)])
  want = Want.create(phone_number: ENV['DANI_NUMBER'], user_id: user.id, product_id: product.id, max_price: rand(50..100), expiration: Faker::Date.forward(23))
end



