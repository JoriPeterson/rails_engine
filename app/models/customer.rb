class Customer < ApplicationRecord
	has_many :invoices
	validates_presence_of :first_name, :last_name

	def transactions
		invoices.joins(:transactions)
			.select("transactions.*")
			.group("transactions.id")
	end

	def favorite_merchant
		invoices.joins("JOIN merchants ON invoices.merchant_id = merchants.id")
			.joins(:transactions)
			.merge(Transaction.successful)
			.select("merchants.*, COUNT(transactions.id) AS favorite")
			.group("merchants.id")
			.order("favorite desc")
			.limit(1)
	end
end
