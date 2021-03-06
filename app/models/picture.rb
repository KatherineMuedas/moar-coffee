class Picture < ActiveRecord::Base
  belongs_to :picable, polymorphic: true
  belongs_to :user
  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end

# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  caption            :string(255)
#  picable_id         :integer
#  picable_type       :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#
