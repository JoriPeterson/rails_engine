require 'rails_helper'

describe "Invoice Relationships" do
  it "sends a merchant invoice belongs to" do

		merchant = create(:merchant)
		invoice = create(:invoice, merchant_id: merchant.id)

    get "/api/v1/invoices/#{invoice.id}/merchant"

		merchant_1 = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(merchant_1["id"]).to eq(merchant.id.to_s)
  end

	it "sends a customer invoice belongs to" do

		customer = create(:customer)
		invoice = create(:invoice, customer_id: customer.id)

    get "/api/v1/invoices/#{invoice.id}/customer"

		customer_1 = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(customer_1["id"]).to eq(customer.id.to_s)
  end

	it "sends a invoice's items" do

		invoice = create(:invoice)
		item = create(:item)
		item_2 = create(:item)
		invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
		invoice_item_2 = create(:invoice_item, invoice_id: invoice.id, item_id: item_2.id)

		get "/api/v1/invoices/#{invoice.id}/items"

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(items.count).to eq(2)
	end

	it "sends a invoice's invoice_items" do

		invoice = create(:invoice)
		item = create(:item)
		item_2 = create(:item)
		invoice_item = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)
		invoice_item_2 = create(:invoice_item, invoice_id: invoice.id, item_id: item_2.id)

		get "/api/v1/invoices/#{invoice.id}/invoice_items"

		invoice_items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoice_items.count).to eq(2)
	end

	it "sends a invoice's transactions" do

		invoice = create(:invoice)
		transaction_1 = create(:transaction, invoice_id: invoice.id)
		transaction_2 = create(:transaction, invoice_id: invoice.id)

		get "/api/v1/invoices/#{invoice.id}/transactions"

		transactions = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(transactions.count).to eq(2)
	end
end
