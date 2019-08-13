class Item < ApplicationRecord
	belongs_to :merchant
	has_many :invoice_items
	has_many :items, through: :invoice_items

	validates_presence_of :name, :description, :unit_price
	attr_reader :most_revenue

	def self.most_revenue
		# joins_to_invoices
		joins(:invoices)
		# order(unit_price: :desc)
	end
end
