class Shop < ActiveRecord::Base
  include PublicActivity::Common
  acts_as_followable
  has_many :drinks, dependent: :destroy
  has_many :reviews, through: :drinks
  has_one  :location, dependent: :destroy
  has_many :pictures, as: :picable, dependent: :destroy


  accepts_nested_attributes_for :location  
  accepts_nested_attributes_for :pictures
  
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      :name
    ]
  end
  private
end

# == Schema Information
#
# Table name: shops
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  website     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  slug        :string(255)
#
