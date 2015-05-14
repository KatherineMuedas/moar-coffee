# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favorite do
  end
end

# == Schema Information
#
# Table name: favorites
#
#  id             :integer          not null, primary key
#  favorable_id   :integer
#  favorable_type :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#
