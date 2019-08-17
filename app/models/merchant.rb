class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
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
		.where({invoices: {created_at: (date.to_date.all_day)}})
		.sum("invoice_items.quantity * invoice_items.unit_price")
	end

	def total_revenue
		invoices.joins(:transactions)
		.joins(:invoice_items)
		.merge(Transaction.successful)
		.sum("invoice_items.quantity * invoice_items.unit_price")
	end

	def single_revenue_by_date(date)
		invoices.joins(:transactions)
		.joins(:invoice_items)
		.merge(Transaction.successful)
		.where({invoices: {created_at: (date.to_date.all_day)}})
		.sum("invoice_items.quantity * invoice_items.unit_price")
	end

	def favorite_customer
		invoices.joins(:transactions)
		.select("invoices.customer_id, COUNT(invoices.id) as favorite")
		.merge(Transaction.successful)
		.group("invoices.customer_id")
		.order("favorite desc")
		.limit(1)
	end
end
