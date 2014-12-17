FactoryGirl.define do
  factory :user do
    email    "dummy@user.com"
    password "password123"
  end

  factory :show do
    datetime Date.new
    venue
  end

  factory :venue do
    sequence :name do |n|
          "#{n}Great Scott"
        end
    street_1  "1222 Commonwealth Ave"
    city      "Allston"
    state     "MA"
    zip_code  "02134"
  end
end
