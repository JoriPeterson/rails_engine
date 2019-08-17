class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :quantity, :unit_price, :item_id, :invoice_id

	attribute :unit_price do |object|
		"%.2f" % (object.unit_price.to_f / 100)
	end
end
