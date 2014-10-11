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
  before_validation :geo_locate_and_normalize
  # before_validation :reverse_geocode, :if => :latitude_changed?
  
  def formatted_address( style=:full)
    if ( style.eql?(:full))
      [street_address, city, state, zipcode].compact.reject(&:blank?).join(', ')
    elsif ( style.eql?(:geo))
      [street_address, city, state, zipcode].compact.reject(&:blank?).join(', ')
    elsif( style.eql?(:short))
      [self[:street_address]].compact.reject(&:blank?).join(', ')
    end
  end

  def full_street_address
    "#{street_address} #{city}, #{state} #{zipcode}"
  end  

  def location_changed?
    self.changed?
  end

  def latitude_changed?
    self.latitude_changed?
  end

  def city_state_or_zip?
    if ( (!self.city.blank? and !self.state.blank? ) or !self.zipcode.blank? )
      return
    end
    self.errors.add(:base, "Please enter at least a city and state or zip for your house")
  end

  def geo_locate_and_normalize
    if self.changed?
      # raise 'the roof'
      if ( self.city.present? && self.state.present? ) || self.zipcode.present?
        Rails.logger.debug( "Geo locating address #{self.formatted_address(:geo)}")
        result = Geocoder.search( formatted_address(:geo) )
        if ( result.nil? || result.size == 0 )
          self.errors.add(:base,"Please check your address, we aren't able to locate you at: #{formatted_address(:geo)}") 
          return
        end
        Rails.logger.debug( "Found #{result.size} addresses for #{formatted_address(:geo)}")
        address_data = result.first
        data = parse_formatted_address_for_attributes( address_data )
        # raise 'the roof'
        distance = Geocoder::Calculations.distance_between( Geocoder.coordinates( data[:zipcode] ), [ data[:latitude], data[:longitude] ] )  
        # data[:distance_from_center] = distance
        self.attributes = data
      end
    end
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
