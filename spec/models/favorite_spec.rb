require 'rails_helper'

RSpec.describe Favorite, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: favorites
#
#  id             :integer          not null, primary key
#  favorable_id   :integer
#  favorable_type :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#
