class Review < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :drink
  has_one :shop, through: :drink
  belongs_to :user
  has_one :picture, as: :picable, dependent: :destroy
  accepts_nested_attributes_for :picture, reject_if: proc { |attributes| attributes['photo'].blank? }, allow_destroy: true

  validates :drink_rating, presence: true

  private

  def review?
    self.review_type == :review    
  end
end

# == Schema Information
#
# Table name: reviews
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  body         :text
#  drink_rating :integer
#  drink_id     :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  review_type  :string(255)
#  shop_id      :integer
#
