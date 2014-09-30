class Drink < ActiveRecord::Base
  belongs_to :shop
  has_many :reviews

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :shop
end
