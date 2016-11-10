# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
create_account = User.create([email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678'])
puts "Admin account created."

create_product = for i in 1..10 do
  Product.create!([title: "Product no.#{i}", description: "這是用種子建立的第 #{i} 個on sale product", price: rand(50..99)*100, quantity: rand(10..49)*100])
end
puts "10 on sale products created."
