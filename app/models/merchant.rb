class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
	validates_presence_of :name

	def most_revenue
		binding.pry
		Merchant.invoice_items.order(quantity: :desc).limit(5)
	end
end
