class Drink < ActiveRecord::Base
  belongs_to :shop
  has_many :reviews
  # has_many :favorites, as: :favorable

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :shop
end
