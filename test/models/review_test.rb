require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: reviews
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  body         :text
#  drink_rating :integer
#  drink_id     :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  review_type  :string(255)
#  shop_id      :integer
#
