FactoryBot.define do
  factory :invoice_item do
    quantity { 3 }
		unit_price { 0.65 }
		item
		invoice
  end
end
