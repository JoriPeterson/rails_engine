require 'rails_helper'

describe "Customer Relationships" do
  it "sends a list of customer's invoices" do

		customer = create(:customer)
		invoice_1 = create(:invoice, customer_id: customer.id)
		invoice_2 = create(:invoice, customer_id: customer.id)

    get "/api/v1/customers/#{customer.id}/invoices"

		invoices = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoices.count).to eq(2)
  end

	it "sends a list of customer's transactions" do
		customer = create(:customer)
		invoice = create(:invoice, customer_id: customer.id)
		transaction_1 = create(:transaction, invoice_id: invoice.id)
		transaction_2 = create(:transaction, invoice_id: invoice.id)

		get "/api/v1/customers/#{customer.id}/transactions"

		transactions = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(transactions.count).to eq(2)
	end
end
