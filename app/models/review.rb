class Review < ActiveRecord::Base
  belongs_to :drink
  has_one :shop, through: :drink
  belongs_to :user
  has_one :picture, as: :picable, dependent: :destroy
  accepts_nested_attributes_for :picture, reject_if: proc { |attributes| attributes['photo'].blank? }, allow_destroy: true
end
