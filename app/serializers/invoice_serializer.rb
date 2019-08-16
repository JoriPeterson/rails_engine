class InvoiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :merchant_id, :customer_id
end
