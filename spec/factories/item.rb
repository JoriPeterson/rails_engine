FactoryBot.define do
  factory :item do
    name { "Ducks" }
		description { "Rubber Duckies" }
		unit_price { 4.99 }
		merchant
  end
end
