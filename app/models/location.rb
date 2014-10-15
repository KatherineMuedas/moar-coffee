class Location < ActiveRecord::Base
  belongs_to :shop
  before_validation :geo_locate_and_normalize
  validate :city_state_or_zip?  
  validates :street_address, presence: true

  geocoded_by :full_street_address
  def full_street_address
    "#{street_address} #{city}, #{state} #{zipcode}"
  end  

  def city_state_or_zip?
    if ( (!self.city.blank? and !self.state.blank? ) or !self.zipcode.blank? )
      return
    end
    self.errors.add(:base, "Please enter at least a city and state or zipcode for this location")
  end

  def geo_locate_and_normalize
    if self.changed?
      if ( self.city.present? && self.state.present? ) || self.zipcode.present?
        Rails.logger.debug( "Geo locating address #{self.formatted_address(:geo)}")
        result = Geocoder.search( formatted_address(:geo) )
        if ( result.nil? || result.size == 0 )
          self.errors.add(:base,"Please check the address, we aren't able to locate the shop at: #{formatted_address(:geo)}") 
          return
        end
        Rails.logger.debug( "Found #{result.size} addresses for #{formatted_address(:geo)}")
        address_data = result.first
        data = parse_formatted_address_for_attributes( address_data )
        # distance = Geocoder::Calculations.distance_between( Geocoder.coordinates( data[:zipcode] ), [ data[:latitude], data[:longitude] ] )  
        # data[:distance_from_center] = distance
        self.attributes = data
      end
    end
  end

  def formatted_address( style=:geo)
    [street_address, city, state, zipcode].compact.reject(&:blank?).join(', ')
  end

  def parse_formatted_address_for_attributes( address_data )
    data={:latitude => address_data.latitude,
          :longitude => address_data.longitude,
          :state => address_data.state_code }
    begin
      formatted_address = address_data.address
      address_components = formatted_address.split(',')
      address_components = address_components.slice(0, address_components.size-1) # remove country
      data.store(:zipcode, address_components.last.split(' ').last.strip)
      address_components = address_components.slice(0, address_components.size-1) # remove state and postal
      data.store(:city, address_components.last.strip)
      address_components = address_components.slice(0, address_components.size-1) # remove city
      data.store(:street_address, address_components.first.strip)
    rescue Exception=>e
      Rails.logger.debug("====fail #{e.inspect()} for #{self.id} and #{address_data.inspect()}")
    end
    data
  end
end
