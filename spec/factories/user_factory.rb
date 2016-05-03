FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email
    password "password"
    first_name "Tester"
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email
    password "password2"
    first_name "Admin"
    last_name "Example"
    admin true
  end
end
