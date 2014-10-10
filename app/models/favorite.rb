class Favorite < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :favorable, polymorphic: true

end
