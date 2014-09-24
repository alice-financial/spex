
FactoryGirl.define do

  sequence :email do |n|
    "#{n}test@test.com"
  end
  sequence :stripe_id do |n|
    "cus_id_#{n}"
  end


  factory :stripe_user do
    email
    name 'some_name'
    stripe_id
  end

end