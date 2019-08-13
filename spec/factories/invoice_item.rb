FactoryBot.define do
  factory :invoice_item do
    quantity { 3 }
		unit_price { 34.88 }
		item
		invoice
  end
end
