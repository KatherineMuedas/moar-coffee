require 'rails_helper'

RSpec.describe Location, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
