FactoryBot.define do
  factory :invoice_item do
    quantity { 3 }
		unit_price { 2000 }
		item
		invoice
  end
end
