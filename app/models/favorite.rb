class Favorite < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :favorable, polymorphic: true

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
