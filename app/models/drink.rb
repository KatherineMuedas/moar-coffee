class Drink < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :shop
  has_many :reviews, dependent: :destroy
  has_many :favorites, as: :favorable, dependent: :destroy
  has_many :pictures, as: :picable, dependent: :destroy
  accepts_nested_attributes_for :pictures

  extend FriendlyId
  friendly_id :name, use: :scoped, scope: :shop
end

# == Schema Information
#
# Table name: drinks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  shop_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  slug        :string(255)
#
