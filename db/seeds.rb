# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.all.empty?
  user = User.new(email: 'user@example.com', password: '12345678')
  puts '~~~> User created!' if user.save

  admin = User.new(email: 'admin@example.com', password: '12345678', admin: true)
  puts '~~~> Admin created!' if admin.save
end
