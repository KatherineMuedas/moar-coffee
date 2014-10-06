class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: :set_default_for_gender
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  acts_as_follower
  has_many :reviews
  has_many :favorites
  has_many :pictures

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :zipcode, presence: true

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      :name,
      [:name, :last_name]
    ]
  end

  def favorited_drinks
    favorites.collect { |x| x.favorable }
  end

  private

  def set_default_for_gender
    if gender
      ":style/female-avatar.jpg"
    else 
      ":style/male-avatar.jpg"
    end 
  end 

end


