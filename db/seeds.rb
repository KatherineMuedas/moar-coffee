Shop.delete_all
Drink.delete_all
Review.delete_all
Favorite.delete_all
Follow.delete_all
Location.delete_all
Picture.delete_all
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
 
locations = ["Salt Lake City", "Park City", "Provo", "Ogden", "Sandy", "New York City", "Seattle", "Portland", "San Francisco", "Reno", "Las Vegas", "Denver", "Albuquerque", "Dallas"]
@client = GooglePlaces::Client.new('AIzaSyAJUOJux-vCYq-5UHUSF6HmLeupTfj0nlU')
locations.each do |location|
  puts "creating shops for #{location}"
  results = @client.spots_by_query("coffee near #{location}")
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
end
 
coffees = [
  {name: "Affogato", description: "An affogato (Italian for drowned) is a coffee-based beverage or dessert. Affogato style, which refers to the act of topping a drink or dessert with espresso, may also incorporate caramel sauce or chocolate sauce."},
  {name: "Americano", description: "Caffè Americano or simply Americano (the
   name is also spelled with varying capitalization and use of diacritics: e.g. Café Americano, Cafe Americano, etc.) is a style of coffee prepared by adding hot water to espresso, giving a similar strength to but different flavor from regular drip coffee." },
  {name: "Australian Coffee ", description: "" },
  {name: "Baileys Irish Cream Coffee", description: "" },
  {name: "Bicerin", description: "" },
  {name: "Black Eye", description: "A Black Eye is dripped coffee with a double shot of espresso. It has a strong taste." },
  {name: "Black Tie", description: "A traditional Thai Iced Tea, which is a spicy and sweet mixture of chilled black tea, orange blossom water, star anise, crushed tamarind, sugar and condensed milk or cream, with a double shot of espresso." },
  {name: "Brandy Coffee ", description: "" },
  {name: "Breve", description: "Beverage made with steamed half and half cream, typically 6oz." },
  {name: "Cafe Mendoza ", description: "" },
  {name: "Cafe mocha", description: "A café mocha is a variant of a caffè latte. Like a latte, it is typically one third espresso and two thirds steamed milk, but a portion of chocolate is added, typically in the form of a chocolate syrup, although other vending systems use instant chocolate powder. Mochas can contain dark or milk chocolate." },
  {name: "Cafe Zorro", description: "A Cafe Zorro is a double espresso, or doppio, added to hot water with a 1:1 ratio." },
  {name: "Caffè Americano", description: "Caffè Americano or simply Americano (the
   name is also spelled with varying capitalization and use of diacritics: e.g. Café Americano, Cafe Americano, etc.) is a style of coffee prepared by adding hot water to espresso, giving a similar strength to but different flavor from regular drip coffee." },
  {name: "Caffè corretto ", description: "" },
  {name: "Caffè crema", description: "As a colorful term it generally means espresso, while in technical discussions, referring to the long drink, it may more narrowly be referred to as Swiss caffè crema." },
  {name: "Caffè Marocchino", description: "The Marocchino is made from espresso, steamed milk, and a dusting of cocoa powder, similar to the espressino." },
  {name: "Caffè Medici", description: "A Caffè Medici is a doppio poured over chocolate syrup and orange peel, usually topped with whipped cream. The drink originated at Seattles historic Last Exit on Brooklyn coffeehouse" },
  {name: "Caffè Tobio", description: "Café Touba is the spiritual beverage of Senegal,
   named for the holy city of Touba. During the roasting process, the coffee beans are mixed with grains of selim, and sometimes other spices" },
  {name: "Caffé Corretto", description: "" },
  {name: "Caffé Latte", description: "A café au lait is traditionally the French way of preparing coffee with milk both at home and in Cafés in Europe." },
  {name: "Caffé macchiato", description: "" },
  {name: "Café au lait", description: "A café au lait is traditionally the French way of preparing coffee with milk both at home and in Cafés in Europe." },
  {name: "Café Bombón", description: "Cafe Bombon was made popular in Valencia, Spain, and spread gradually to the rest of the country. " },
  {name: "Café Crema", description: "As a colorful term it generally means espresso, while in technical discussions, referring to the long drink, it may more narrowly be referred to as Swiss caffè crema." },
  {name: "Café Cubano", description: "Café Cubano is a type of espresso which originated in Cuba after espresso machines were first imported there from Italy." },
  {name: "Café de olla", description: "Café de olla or pot coffee is a traditional coffee-based drink prepared using earthen clay pots or jars in Mexico and other Latin American countries. " },
  {name: "Café miel", description: "A café miel has a shot of espresso, steamed milk, cinnamon, and honey. The
   name comes from the French word for honey, miel." },
  {name: "Café mélange", description: "" },
  {name: "Café Touba", description: "Caffè Tobio is an espresso drink with an equal amount of regular coffee. This combination simultaneously helps the flavor of weak coffee and hides the bitter flavor of espresso. Useful in chain coffee bars." },
  {name: "Calypso Coffee ", description: "" },
  {name: "Cappuccino ", description: "Cappuccino is a coffee-based drink prepared with espresso, hot milk, and steamed milk foam. " },
  {name: "Carajillo", description: "" },
  {name: "Chai Latte", description: "Numerous houses use the term chai latte to indicate that the steamed milk of a normal cafè latte is being flavoured with a spiced tea concentrate instead of with espresso. Add espresso shots for a Dirty Chai Latte." },
  {name: "Coffee liqueurs ", description: "" },
  {name: "Coffee milk", description: "A coffee milk is a drink similar to chocolate milk; however, instead of chocolate syrup, coffee syrup is used. It is the official state drink of Rhode Island in the United States." },
  {name: "Cold Brew", description: "Cold brew, or cold-press, refers to the process of steeping coffee grounds in room temperature or cold water for an extended period." },
  {name: "Corfu Coffee ", description: "" },
  {name: "Cortado", description: "A cortado is an espresso (also known as Pingo or Garoto) cut (from the Spanish and Portuguese cortar) with a small amount of warm milk to reduce the acidity" },
  {name: "Cuban espresso", description: "" },
  {name: "Doppio", description: "Doppio in espresso is a double shot, extracted using a double filter basket in the portafilter." },
  {name: "Eggnog Latte", description: "An autumn and winter seasonal blend of steamed milk and eggnog, plus espresso and a pinch of nutmeg." },
  {name: "Eiskaffee", description: "Eiskaffee, literally ice cream coffee, is a popular German drink consisting of chilled coffee, milk, sweetener, vanilla ice cream, and sometimes whipped cream." },
  {name: "English Coffee ", description: "" },
  {name: "Espresso", description: "Espresso is a concentrated beverage brewed by forcing a small amount of nearly boiling water " },
  {name: "Flat white", description: "A flat white is an espresso coffee with a similar proportion of coffee to milk as a caffè latte and a cappuccino" },
  {name: "Frappuccino", description: "" },
  {name: "Galao", description: "Galão is a hot drink from Portugal made of espresso and foamed milk. In all similar to caffè latte or café au lait, it comes in a tall glass with about one quarter coffee" },
  {name: "Greek frappé coffee", description: "Greek frappé (Café frappé) (Greek: φραπές) is a foam-covered iced coffee drink made from spray-dried instant coffee. It is very popular in Greece especially during summer" },
  {name: "Green Eye", description: "A Green Eye (also known as Triple Death) is drip brewed dark-roast coffee with a triple shot of espresso." },
  {name: "Guillermo", description: "Originally one or two shots of hot espresso, poured over slices of lime. It can also be served on ice, sometimes with a touch of milk." },
  {name: "Half-caf", description: "" },
  {name: "Iced Coffee ", description: "Iced coffee is a cold variant of the normally hot beverage coffee." },
  {name: "Indian filter coffee", description: "South Indian Coffee, also known as Mysore Filter Coffee or Kaapi (South Indian phonetic rendering of coffee) is a sweet milky coffee made from dark roasted coffee beans" },
  {name: "Instant coffee", description: "Instant coffee is a beverage derived from brewed coffee beans. Through various manufacturing processes the coffee is dehydrated into the form of powder or granules. " },
  {name: "Irish Coffee ", description: "Irish coffee is coffee combined with whiskey and cream, often further sweetened with sugar. Also available as a flavor of ice cream." },
  {name: "Jamaican Coffee ", description: "" },
  {name: "Kaffee Fertig ", description: "Kape Barako, also spelled Baraco (English: Barako coffee) is a coffee varietal grown in the Philippines, particularly in the provinces of Batangas and Cavite. " },
  {name: "Kapeng barako", description: "" },
  {name: "Keoke Coffee ", description: "" },
  {name: "Kopi Luwak", description: "" },
  {name: "Kopi susu", description: "Kopi susu is found in (at least) Malaysia, Borneo and Indonesia and very similar to the preceding entry for Ca phe sua nong. " },
  {name: "Kopi Tubruk", description: "" },
  {name: "Latte macchiato", description: "Latte macchiato literally means stained milk. This refers to the method of preparation, wherein the milk gets stained by the addition of espresso." },
  {name: "Liqueur coffee", description: "" },
  {name: "Macchiato", description: "Caffè macchiato – Macchiato, meaning stained, is an Espresso with a dash of foamed milk. At first sight it resembles a small Cappuccino, but even if the ingredients are the same as those used for Cappuccino, a Macchiato has a much stronger and aromatic taste." },
  {name: "Mazagran", description: "Mazagran (sometimes misspelled as Mazagrin) is a long cold coffee beverage usual in Portugal and served in a tall glass. " },
  {name: "Mocha", description: "" },
  {name: "Mochasippi", description: "" },
  {name: "Moka", description: "Moka coffee is coffee brewed with a moka pot, a stove-top coffee maker which produces coffee by passing hot water pressurized by steam through ground coffee in a lower pressure than an espresso maker. " },
  {name: "Monks Coffee ", description: "" },
  {name: "Mélange", description: "Mélange is popular in Austria, Switzerland and the Netherlands, and is traditionally similar to caffè latte and cappuccino (and more a mix of the two), a large cup with (today) espresso and steamed milk with some milk foam." },
  {name: "Palazzo", description: "A Palazzo is an iced coffee variant, popular in Southern California. It is two shots of espresso, chilled immediately after brewing and mixed with sweetened cream. A Palazzo is typically made using a moka pot." },
  {name: "PapiCoffee", description: "" },
  {name: "Pharisäer", description: "A Pharisäer, meaning a Pharisee, is an alcoholic coffee beverage that is popular in the Nordfriesland district of Germany. It consists of a mug of black coffee, a double shot of rum, and a topping of whipped cream. " },
  {name: "Pocillo", description: "A shot or small portion of unsweetened coffee, now usually made either using an espresso machine or a moka pot, but traditionally made using a cloth drip, usually served in cups made for the purpose (called tazitas de pocillo)." },
  {name: "Red Eye", description: "A Red Eye is dripped coffee with a single shot of espresso. This drink is also known as a Shot in the Dark." },
  {name: "Red Tie", description: "A traditional Thai Iced Tea, which is a spicy and sweet mixture of chilled black tea, orange blossom water, star anise, crushed tamarind, sugar and condensed milk or cream, with a single shot of espresso." },
  {name: "Red Tux", description: "A Zebra Mocha combined with raspberry flavoring." },
  {name: "Ristretto", description: "Ristretto is a very short shot of espresso coffee. Originally this meant pulling a hand press faster than usual using the same amount of water as a regular shot of espresso. " },
  {name: "Russian Coffee ", description: "" },
  {name: "Seville Coffee ", description: "" },
  {name: "Shin Shin Coffee ", description: "" },
  {name: "The Flat White", description: "" },
  {name: "Turkish coffee", description: "Beans for Turkish coffee are ground or pounded to the finest possible powder, finer than for any other way of preparation. " },
  {name: "Vienna coffee", description: "A Vienna coffee is the
   name of a popular traditional cream based coffee beverage. It is made by preparing two shots of espresso in a standard sized coffee cup and infusing the coffee with whipped cream (as a replacement for milk and sugar) until the cup is full. " },
  {name: "White Coffee", description: "Ipoh White Coffee is a popular coffee drink which originated in Ipoh, Perak, Malaysia. The coffee beans are roasted with palm-oil margarine, and the resulting coffee is served with condensed milk. The taste is smooth and sweet, and is often served iced." },
  {name: "Witchs Coffee ", description: "" },
  {name: "Yuanyang", description: "Yuanyang, sometimes also called Ying Yong, is a popular beverage in Hong Kong, made of a mixture of coffee and Hong Kong-style milk tea. " }
]
 
Shop.each do |shop|
  3..10.times do
    coffee = coffees.sample
    shop.drinks.create(name: coffee[:name], description: coffee[:description])
    puts "created #{coffee[:name]} for #{shop.name}"
  end
 
end