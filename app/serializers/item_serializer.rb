class ItemSerializer
  include FastJsonapi::ObjectSerializer

	belongs_to :merchant
	has_many :invoice_items
	has_many :invoices, through: :invoice_items

  attributes :id, :name, :description, :unit_price, :merchant_id

	attribute :unit_price do |object|
		"%.2f" % (object.unit_price.to_f / 100)
	end
end
