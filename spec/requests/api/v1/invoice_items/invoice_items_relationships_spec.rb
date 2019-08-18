require 'rails_helper'

describe "InvoiceItem Relationships" do
  it "sends a invoice invoice_item belongs to" do

		invoice = create(:invoice)
		invoice_item = create(:invoice_item, invoice_id: invoice.id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

		invoice_1 = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoice_1["id"]).to eq(invoice.id.to_s)
  end

	it "sends a invoice invoice_item belongs to" do

		item = create(:item)
		invoice_item = create(:invoice_item, item_id: item.id)

		get "/api/v1/invoice_items/#{invoice_item.id}/item"

		item_1 = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(item_1["id"]).to eq(item.id.to_s)
	end
end
