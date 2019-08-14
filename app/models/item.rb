class Item < ApplicationRecord
	belongs_to :merchant
	has_many :invoice_items
	has_many :invoices, through: :invoice_items

	validates_presence_of :name, :description, :unit_price

	def self.most_revenue(quantity)
		joins(:invoices)
			.select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
			# .where
			.group(:id)
			.order("revenue desc")
			.limit(quantity)
	end
end
