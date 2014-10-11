# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# shops = ["Java Shop", "Sunset Cafe", "Coffee Break", "SLC Roasting Company"]

# shops.each do |shop|
#   Shop.create!(
#                name: shop,
#                description: "Drink coffee at #{shop}! It's javalicious!"
#                )
#   puts 'CREATED SHOP: ' << shop
# end

# users = ["Phil", "Kat", "Chase"]

# users.each do |user|
#   User.create!(
#                name: user,
#                email: "#{user}@email.com",
#                password: "password",
#                password_confirmation: "password",
#                zipcode: 44444
#                )
#   puts "CREATED USER: " << user
# end

Shop.delete_all
@client = GooglePlaces::Client.new(ENV['GOOGLEAPI'])
results = @client.spots_by_query('coffee near Salt Lake City')
results.each do |shop|
  s = Shop.create(name: shop.name)
  s.build_location(latitude: shop.lat, longitude: shop.lng)
end