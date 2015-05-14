# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    caption "MyString"
  end
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
