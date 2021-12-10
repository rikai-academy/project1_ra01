# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  id: 1,
  name: "penpao",
  email: "penpao@example.com",
  password_digest: "123456",
  remember_digest: "123456"
)
user.save!


category = ProductCategory.new(
  id: 1,
  name: "Sach Giao Khoa",
)
category.save!

100.times do |index|
  Product.create!(
    name: Faker::Book.title,
    description: "This file should contain all the record creation needed to seed the database with its default values #{index}.",
    author: Faker::Artist.name,
    company: Faker::Company.name,
    price: 123,
    discount: 0,
    product_category_id: category.id,
    user_id: user.id
  )
end
