FactoryBot.define do
  factory :item do
    name { "Ducks" }
		description { "Rubber Duckies" }
		unit_price { 0.04 }
		merchant
  end
end
