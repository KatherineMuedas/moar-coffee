FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  zipcode                :string(255)
#  gender                 :boolean
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  slug                   :string(255)
#  last_name              :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  points                 :integer          default(0)
#  rank                   :integer          default(0)
#
