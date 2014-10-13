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

users = ["Phil", "Kat", "Chase"]

users.each do |user|
  User.create!(
               name: user,
               email: "#{user}@email.com",
               password: "password",
               password_confirmation: "password",
               zipcode: 44444
               )
  puts "CREATED USER: " << user
end

Shop.delete_all
@client = GooglePlaces::Client.new(ENV['GOOGLEAPI'])
results = @client.spots_by_query('coffee near Salt Lake City')
results.each do |shop|
  s = Shop.new(name: shop.name)
  # s.create_(city: shop.formatted_address)
  # Splits formatted_address from API into seperate street_address, city, state, and zip
  counter = 0
  # formatted_address split by comma. Splits everything except for zip and state (ie ['UT 84111'])
  initial_address_array = shop.formatted_address.split(',')
  final_address_array = []
  # go through initial_address_array[0](street_address) and initial_address_array[1](city) and add them to final_address_array
  while counter <= 1
    final_address_array << initial_address_array[counter]
    counter += 1
  end
  # split the initial_address_array[2](state and zip) into two seperate cells and add them to the final_address_array
  initial_address_array[counter].split(' ').each do |cell|
    final_address_array << cell
  end
  # set location city, state, street_address, and zip from final_address_array
  s.build_location(latitude: shop.lat, longitude: shop.lng, city: final_address_array[1], state: final_address_array[2], street_address: final_address_array[0], zipcode: final_address_array[3])
  s.save
end