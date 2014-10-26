class User < ActiveRecord::Base
  include PublicActivity::Common
  enum rank: [ :beginner, :half_and_half, :expert ]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: :set_default_for_gender
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  acts_as_follower
  acts_as_followable
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :pictures, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :name, :zipcode, presence: true

  devise :omniauthable, :omniauth_providers => [:facebook]
  def self.from_omniauth(auth)
    where("email = ? OR provider = ? AND uid = ? ", auth.info.email, auth.provider, auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   
    # user.image = auth.info.picture worry about this when name is working
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
def update_with_password(params={}) 
  if params[:password].blank? 
    # params.delete(:current_password)
    params.delete(:password) 
    params.delete(:password_confirmation) if params[:password_confirmation].blank? 
  end 
  update_attributes(params) 
end
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

  def give_points(points_to_give)
    self.update_attributes(points: self.points += points_to_give)
    check_if_rank_up
  end 

def check_if_rank_up
  if self.rank == "beginner" && self.points >=20
    self.half_and_half!
  elsif self.rank == "half_and_half" && self.points >=30
    self.expert!
  end   
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


