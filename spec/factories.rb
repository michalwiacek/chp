FactoryBot.define do

  factory :user do
    first_name "Joe"
    last_name "Doe"
    email "joe@gmail.com"
    phone "123123123"
  end

  factory :company do
    name "Chmiera Prime"
  end

  # factory :user_address, class: Address do
  #   association :addressable, factory: :user
  #   street "Hoza 76"
  #   city "Warszawa"
  #   zip_code "00-682"
  #   country "Poland"
  # end

  # factory :company_address, class: Address do
  #   association :addressable, factory: :company
  #   street "Aleje Jerozolimskie 81"
  #   city "Warszawa"
  #   zip_code "02-001"
  #   country "Poland"
  # end
end
