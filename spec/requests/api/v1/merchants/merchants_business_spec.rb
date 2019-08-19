require 'rails_helper'

describe "Merchant Business Logic" do
	before :each do
		@merchant_1 = create(:merchant, name: "Bananas")
		@merchant_2 = create(:merchant, name: "Oranges")
		@merchant_3 = create(:merchant, name: "Apples")

		@customer_1 = create(:customer)
		@customer_2 = create(:customer)
		@customer_3 = create(:customer)
		@customer_4 = create(:customer)
		@customer_5 = create(:customer)
		@customer_6 = create(:customer)

		@item_1 = create(:item, unit_price: 1500, merchant_id: @merchant_1.id)
		@item_2 = create(:item, unit_price: 1000, merchant_id: @merchant_1.id)
		@item_3 = create(:item, unit_price: 1000, merchant_id: @merchant_2.id)
		@item_4 = create(:item, unit_price: 1000, merchant_id: @merchant_2.id)
		@item_5 = create(:item, unit_price: 1500, merchant_id: @merchant_2.id)
		@item_6 = create(:item, unit_price: 2000, merchant_id: @merchant_3.id)

		@invoice_1 = create(:invoice, merchant_id: @merchant_1.id, customer_id: @customer_1.id, created_at: "2019-08-18")
		@invoice_2 = create(:invoice, merchant_id: @merchant_1.id, customer_id: @customer_1.id, created_at: "2019-08-18")
		@invoice_3 = create(:invoice, merchant_id: @merchant_2.id, customer_id: @customer_3.id, created_at: "2019-08-18")
		@invoice_4 = create(:invoice, merchant_id: @merchant_2.id, customer_id: @customer_4.id, created_at: "2019-08-18")
		@invoice_5 = create(:invoice, merchant_id: @merchant_2.id, customer_id: @customer_5.id, created_at: "2019-08-18")
		@invoice_6 = create(:invoice, merchant_id: @merchant_3.id, customer_id: @customer_6.id, created_at: "2019-08-18")

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

  it "returns merchants with most revenue" do

    get '/api/v1/merchants/most_revenue?quantity=2'

		merchants = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(merchants.count).to eq(2)
		expect(merchants[0]["id"]).to eq(@merchant_2.id.to_s)
		expect(merchants[1]["id"]).to eq(@merchant_1.id.to_s)
  end

	it "returns merchants with most items" do
		get '/api/v1/merchants/most_items?quantity=2'

		merchants = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(merchants.count).to eq(2)
		expect(merchants[0]["id"]).to eq(@merchant_2.id.to_s)
		expect(merchants[1]["id"]).to eq(@merchant_1.id.to_s)
	end

	it "returns all merchant revenue by date" do

		get '/api/v1/merchants/revenue?date=2019-08-18'

		revenue = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(revenue["attributes"]["total_revenue"]).to eq("80.00")
	end

	it "returns all revenue for single merchant" do

		get "/api/v1/merchants/#{@merchant_1.id}revenue"

		revenue = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(@merchant_1.total_revenue).to eq(2500)
	end

	it "returns single merchant's revenue by date" do

		get "/api/v1/merchants/#{@merchant_1.id}/revenue?date=2019-08-18"

		revenue = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(revenue["attributes"]["revenue"]).to eq("25.00")
	end

	it "returns single merchant's favorite customer" do

		get "/api/v1/merchants/#{@merchant_1.id}/favorite_customer"

		revenue = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(@merchant_1.favorite_customer[0]["customer_id"]).to eq(@customer_1.id)
	end
end
