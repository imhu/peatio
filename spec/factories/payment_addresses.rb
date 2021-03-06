# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :payment_address do
    address 'MyString'
    currency { Currency.find_by!(code: :usd) }
    account { create(:member, :verified_identity).get_account(:usd) }

    trait :btc_address do
      address { Faker::Bitcoin.address }
      currency { Currency.find_by!(code: :btc) }
      account { create(:member, :verified_identity).get_account(:btc) }
    end

    factory :btc_payment_address, traits: [:btc_address]
  end
end
