class Review < ActiveRecord::Base
  belongs_to :drink
  has_one :shop, through: :drink
  belongs_to :user
end
