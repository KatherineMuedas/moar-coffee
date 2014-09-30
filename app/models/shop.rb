class Shop < ActiveRecord::Base
  has_many :drinks
  has_many :reviews, through: :drinks
  has_many :favorites, as: :favorable
    
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      :name
    ]
  end

end
