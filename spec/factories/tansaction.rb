FactoryBot.define do
  factory :transaction do
    invoice
		credit_card_number {"1234 5678 1234 1324"}
		expiration_date {"02/12"}
		result { 0 }
  end
end
