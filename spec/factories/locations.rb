# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    street_address "MyString"
    city "MyString"
    state "MyString"
    zipcode "MyString"
    lat 1.5
    long 1.5
    shop nil
  end
end
