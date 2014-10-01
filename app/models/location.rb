class Location < ActiveRecord::Base
  belongs_to :shop
  geocoded_by :full_street_address
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city = geo.city
      obj.zipcode = geo.postal_code
      obj.state = geo.state_code
      obj.street_address = geo.address
    end
  end  
  after_validation :geocode
  after_validation :reverse_geocode

  def full_street_address
  
    "#{shop.name} #{street_address} #{city}, #{state} #{zipcode}"
  end  
end
