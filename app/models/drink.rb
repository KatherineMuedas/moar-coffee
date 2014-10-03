class Drink < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :shop
  has_many :reviews
  has_many :favorites, as: :favorable
  has_many :pictures, as: :picable, dependent: :destroy
  accepts_nested_attributes_for :pictures

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :shop
end
