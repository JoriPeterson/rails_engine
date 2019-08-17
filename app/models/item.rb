class Item < ApplicationRecord
	belongs_to :merchant
	has_many :invoice_items
	has_many :invoices, through: :invoice_items

	validates_presence_of :name, :description, :unit_price

	def self.most_revenue(quantity)
		joins([invoices: :transactions])
			.select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
			.group(:id)
			.where("transactions.result = ?", "success")
			.order("revenue desc")
			.limit(quantity)
	end

	def self.most_items(quantity)
		joins(:invoices)
			.select("items.*, SUM(invoice_items.quantity) AS count")
			.group(:id)
			.order("count desc")
			.limit(quantity)
	end

	def best_day
		invoices.joins(:transactions)
			.merge(Transaction.successful)
			.select("invoices.created_at, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
			.group("invoices.created_at")
			.order("revenue desc")
			.order("invoices.created_at desc")
			.limit(1)
	end
end
