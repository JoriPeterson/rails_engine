require 'rails_helper'

describe "Merchant Relationships" do
  it "sends a merchant's items " do

		merchant = create(:merchant)
		item_1 = create(:item, merchant_id: merchant.id)
		item_2 = create(:item, merchant_id: merchant.id)
		item_3 = create(:item, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(items.count).to eq(3)
  end

	describe "Merchant Relationships" do
	  it "sends a merchant's items " do

			merchant = create(:merchant)
			invoice_1 = create(:invoice, merchant_id: merchant.id)
			invoice_2 = create(:invoice, merchant_id: merchant.id)
			invoice_3 = create(:invoice, merchant_id: merchant.id)

	    get "/api/v1/merchants/#{merchant.id}/invoices"

			invoices = JSON.parse(response.body)["data"]

			expect(response).to be_successful
			expect(invoices.count).to eq(3)
	  end
	end
end
