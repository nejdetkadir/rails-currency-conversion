FactoryBot.define do
  factory :currency do
    iso_code { Faker::Currency.code }
    rate { rand(1.1..100).to_d }
    is_base { Faker::Boolean.boolean }
  end
end
