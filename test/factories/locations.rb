# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    street_address '430 E 400 S'
    city 'Salt Lake City'
    state 'Utah'
    zipcode '84111'
  end
end

# == Schema Information
#
# Table name: locations
#
#  id             :integer          not null, primary key
#  street_address :string(255)
#  city           :string(255)
#  state          :string(255)
#  zipcode        :string(255)
#  latitude       :float
#  longitude      :float
#  shop_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#
