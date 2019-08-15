class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
	has_many :invoice_items, through: :invoice_items
	validates_presence_of :name

	def self.most_revenue(quantity)
		joins([invoices: :transactions]
			.joins("JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
			.select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
			.where("transactions.result = ?", "success")
			.group(:id)
			.order("revenue desc")
			.limit(quantity)
	end
end
