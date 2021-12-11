FactoryBot.define do
  factory :conversion do
    currency { create(:currency) }
    to { create(:currency) }
  end
end
