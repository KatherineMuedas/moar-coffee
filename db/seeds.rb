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

User.delete_all
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
  # s.pictures_attributes(photo: shop.photos)
  # s.photo = shop.photos

  s.save
end
  # photo_file_size: shop.height & shop.width
  # photo_file_name: shop.photo_reference

  # create_table "pictures", force: true do |t|
  #   t.string   "caption"
  #   t.integer  "picable_id"
  #   t.string   "picable_type"
  #   t.string   "photo_file_name"
  #   t.string   "photo_content_type"
  #   t.integer  "photo_file_size"
  #   t.datetime "photo_updated_at"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  #   t.integer  "user_id"

   #  @photos=
   # [#<GooglePlaces::Photo:0x00000106706410
   #   @api_key="AIzaSyDWbsZx36yXPkRly0EAGHiJ_ot6aanKV08",
   #   @height=446,
   #   @html_attributions=[],
   #   @photo_reference=
   #    "CnRnAAAAMmKpaXxYqc1oRXoL7ZKQSPgu9QWzRrDG1hN1lG3F_l4_Lt_k6KQ9YGI1mHbMnv5WatVqaOikTEZUh0_JpiTzIJdIKbdbtKqBO4USiuS7S8rRhlpJQQ-cU6ZlSx52fMf4XBeV2ITyOJB0iSuwhFVE2hIQgL79mhKTtgwSMLXw23lJrBoUlLgHEfxCAWLQOGBB8eS2lMSgm1s",
   #   @sensor=false,
   #   @width=760>],
