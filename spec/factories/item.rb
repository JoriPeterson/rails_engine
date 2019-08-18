FactoryBot.define do
  factory :item do
    name { "Ducks" }
		description { "Rubber Duckies" }
		unit_price { 200 }
		merchant
  end
end
