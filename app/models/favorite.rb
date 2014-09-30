class Favorite < ActiveRecord::Base
  belongs_to :favorable, polymorphic: true
  # belongs_to :user
end
