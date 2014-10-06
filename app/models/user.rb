class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, default_url: :set_default_for_gender
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :reviews
  has_many :favorites
  has_many :pictures

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :name, :zipcode, presence: true

  devise :omniauthable, :omniauth_providers => [:facebook]
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
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


