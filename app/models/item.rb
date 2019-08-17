class Item < ApplicationRecord
	belongs_to :merchant
	has_many :invoice_items
	has_many :invoices, through: :invoice_items

	validates_presence_of :name, :description, :unit_price

	default_scope {order(id: :asc)}

	def self.most_revenue(quantity)
		joins([invoices: :transactions])
			.select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
			.group(:id)
			.where("transactions.result = ?", "success")
			.order("revenue desc")
			.limit(quantity)
	end

	def self.most_items(quantity)
		#don't put transactions in query
	end
end
