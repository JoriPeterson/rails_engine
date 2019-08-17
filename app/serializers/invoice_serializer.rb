class InvoiceSerializer
  include FastJsonapi::ObjectSerializer

	belongs_to :merchant
	belongs_to :customer
	has_many :transactions
	has_many :invoice_items
	has_many :items, through: :invoice_items

	attributes :id, :status, :merchant_id, :customer_id

end
