[![Code Climate](https://codeclimate.com/github/KatherineMuedas/moar-coffee/badges/gpa.svg)](https://codeclimate.com/github/KatherineMuedas/moar-coffee)




###Community based, coffee experience sharing application. Rate and enjoy coffees from your local coffee shops. Find and explore new coffees based on real users experiences. 

Models:
  Users:
    - name, zip code, photo(avatar), gender, points*, rank*
    - has many: reviews,pictures, favorites* 
  shops index show new create edit update 
    - name, description ,website, menu website
    - has many: drinks reviews through drinks pictures
    - has one: location 

  Location(of shops):
    - street address, city, state zipcode, phone number 

  drinks: show new create edit update
    - name, description(optional)
    - has many: reviews
    - belongs to: shop

  Reviews:  create destroy
    - title, body, drink rating(first integer)
    - has one: picture
    - belongs to: drink, user

  Pictures:
    - caption, photo
    - belongs to: review, shop, user

  Favorites*:
    - belongs_to user, shop

Other Ideas
  Follow Users
  Public activity /news feed
  Points*, rank* & Leader board
  Geolocation for finding user location
  Google maps
  Login with Facebook, twitter, github, google+
  Sharing with Facebook, twitter 


Basic Idea
  When the user arrive to his profile page he will find an option “Add and find  shops”
  When he select the Add and find shops option he will be directed to list of shops
  When the user select a shop will be redirect to the shop page where is going to find a  list of drinks with their reviews. 

 

