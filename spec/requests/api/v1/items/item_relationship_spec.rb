require 'rails_helper'

describe "Item Relationships" do
  it "sends a merchant item belongs to" do

		merchant = create(:merchant)
		item = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item.id}/merchant"

		merchant_1 = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(merchant_1["id"]).to eq(merchant.id.to_s)
  end

	it "sends a invoice's items" do

		invoice_1 = create(:invoice)
		invoice_2 = create(:invoice)
		item = create(:item)
		invoice_item_1 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item.id)
		invoice_item_2 = create(:invoice_item, invoice_id: invoice_2.id, item_id: item.id)

		get "/api/v1/items/#{item.id}/invoice_items"

		invoice_items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoice_items.count).to eq(2)
	end
end
