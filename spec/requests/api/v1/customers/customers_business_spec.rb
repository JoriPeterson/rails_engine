require 'rails_helper'

describe "Customer Business Logic" do
	before :each do
		@merchant_1 = create(:merchant, name: "Bananas")
		@merchant_2 = create(:merchant, name: "Oranges")
		@merchant_3 = create(:merchant, name: "Apples")

		@customer_1 = create(:customer)

		@item_1 = create(:item, unit_price: 500, merchant_id: @merchant_1.id)
		@item_2 = create(:item, unit_price: 1000, merchant_id: @merchant_1.id)
		@item_3 = create(:item, unit_price: 1000, merchant_id: @merchant_2.id)
		@item_4 = create(:item, unit_price: 1000, merchant_id: @merchant_2.id)
		@item_5 = create(:item, unit_price: 1500, merchant_id: @merchant_2.id)
		@item_6 = create(:item, unit_price: 2000, merchant_id: @merchant_3.id)
		@item_7 = create(:item, unit_price: 2000, merchant_id: @merchant_3.id)
		@item_8 = create(:item, unit_price: 2000, merchant_id: @merchant_3.id)

		@invoice_1 = create(:invoice, merchant_id: @merchant_1.id, customer_id: @customer_1.id, created_at: "2019-08-18")
		@invoice_2 = create(:invoice, merchant_id: @merchant_1.id, customer_id: @customer_1.id, created_at: "2019-08-18")
		@invoice_3 = create(:invoice, merchant_id: @merchant_1.id, customer_id: @customer_1.id, created_at: "2019-08-18")
		@invoice_4 = create(:invoice, merchant_id: @merchant_1.id, customer_id: @customer_1.id, created_at: "2019-08-18")
		@invoice_5 = create(:invoice, merchant_id: @merchant_3.id, customer_id: @customer_1.id, created_at: "2019-08-18")
		@invoice_6 = create(:invoice, merchant_id: @merchant_3.id, customer_id: @customer_1.id, created_at: "2019-08-18")

		@invoice_item_1 = create(:invoice_item, quantity: 1, unit_price: @item_1.unit_price, item_id: @item_1.id, invoice_id: @invoice_1.id)
		@invoice_item_2 = create(:invoice_item, quantity: 1, unit_price: @item_2.unit_price, item_id: @item_2.id, invoice_id: @invoice_2.id)
		@invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: @item_3.unit_price, item_id: @item_3.id, invoice_id: @invoice_3.id)
		@invoice_item_4 = create(:invoice_item, quantity: 1, unit_price: @item_4.unit_price, item_id: @item_4.id, invoice_id: @invoice_4.id)
		@invoice_item_5 = create(:invoice_item, quantity: 1, unit_price: @item_5.unit_price, item_id: @item_5.id, invoice_id: @invoice_5.id)
		@invoice_item_6 = create(:invoice_item, quantity: 1, unit_price: @item_6.unit_price, item_id: @item_6.id, invoice_id: @invoice_6.id)

		@transaction_1 = create(:transaction, invoice_id: @invoice_1.id)
		@transaction_2 = create(:transaction, invoice_id: @invoice_2.id)
		@transaction_3 = create(:transaction, invoice_id: @invoice_3.id)
		@transaction_4 = create(:transaction, invoice_id: @invoice_4.id)
		@transaction_5 = create(:transaction, invoice_id: @invoice_5.id)
		@transaction_6 = create(:transaction, invoice_id: @invoice_6.id)
	end

	it "returns the favorite merchant for a customer" do

		get "/api/v1/customers/#{@customer_1.id}/favorite_merchant"

		favorite_merchant = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(favorite_merchant["attributes"]["name"]).to eq(@merchant_1.name)
	end
end
