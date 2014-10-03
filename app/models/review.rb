class Review < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :drink
  has_one :shop, through: :drink
  belongs_to :user
end
