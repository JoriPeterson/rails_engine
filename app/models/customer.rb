class Customer < ApplicationRecord
	has_many :invoices
	validates_presence_of :first_name, :last_name

	def transactions
		invoices.joins(:transactions)
		.select("transactions.*")
		.group("transactions.id")
	end
end
