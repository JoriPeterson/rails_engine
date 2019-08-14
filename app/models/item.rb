class Item < ApplicationRecord
	belongs_to :merchant
	has_many :invoice_items
	has_many :invoices, through: :invoice_items

	validates_presence_of :name, :description, :unit_price

	def self.most_revenue(quantity)
		joins(:invoices).select("invoice_items.quantity * invoice_items.price AS most_revenue")
										.order("most_revenue desc")
										.limit(quantity)
	end
end
