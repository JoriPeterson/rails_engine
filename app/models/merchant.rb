class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
	has_many :invoice_items, through: :invoice_items
	validates_presence_of :name

	def self.most_revenue(quantity)
		joins([invoices: :transactions])
			.joins("JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
			.select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
			.merge(Transaction.successful)
			.group(:id)
			.order("revenue desc")
			.limit(quantity)
	end

	def self.most_items(quantity)
		joins([invoices: :transactions])
			.joins("JOIN invoice_items ON invoices.id = invoice_items.invoice_id")
			.select("merchants.*, SUM(invoice_items.quantity) AS count")
			.merge(Transaction.successful)
			.group(:id)
			.order("count desc")
			.limit(quantity)
	end

	def self.revenue_by_date(date)
		Invoice.joins(:invoice_items, :transactions)
		.merge(Transaction.successful)
		.where({invoice_items: {created_at: (date.to_date.all_day)}})
		.sum("invoice_items.quantity * invoice_items.unit_price")
	end
end
