class Shop < ActiveRecord::Base
  has_many :drinks
  has_many :reviews, through: :drinks
end
