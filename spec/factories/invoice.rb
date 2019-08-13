FactoryBot.define do
  factory :invoice do
    name { "item" }
		status { "shipped" }
		merchant
		customer
  end
end
