FactoryBot.define do
  factory :item do
    name { "Ducks" }
		description { "Rubber Duckies" }
		unit_price { 4.99 }
		merchant_id { 1 }
  end
end
