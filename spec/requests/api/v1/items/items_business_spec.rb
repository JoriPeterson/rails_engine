require 'rails_helper'

describe "Item Business Logic" do
	before :each do

		@item_1 = create(:item, name: "Banana", unit_price: 500)
		@item_2 = create(:item, name: "Apple", unit_price: 500)
		@item_3 = create(:item, name: "Grape", unit_price: 1000)
		@item_4 = create(:item, name: "Strawberry", unit_price: 1000)
		@item_5 = create(:item, name: "Blueberry", unit_price: 1500)
		@item_6 = create(:item, name: "Peach", unit_price: 6050)
		@item_7 = create(:item, name: "Plum", unit_price: 5000)
		@item_8 = create(:item, name: "Kiwi", unit_price: 4000)

		@invoice_1 = create(:invoice, created_at: "2019-08-18")
		@invoice_2 = create(:invoice, created_at: "2019-08-18")
		@invoice_3 = create(:invoice, created_at: "2019-08-18")
		@invoice_4 = create(:invoice, created_at: "2019-08-18")
		@invoice_5 = create(:invoice, created_at: "2019-08-18")
		@invoice_6 = create(:invoice, created_at: "2019-08-18")

		@invoice_item_1 = create(:invoice_item, quantity: 1, unit_price: @item_1.unit_price, item_id: @item_1.id, invoice_id: @invoice_1.id)
		@invoice_item_2 = create(:invoice_item, quantity: 1, unit_price: @item_1.unit_price, item_id: @item_1.id, invoice_id: @invoice_2.id)
		@invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: @item_2.unit_price, item_id: @item_2.id, invoice_id: @invoice_3.id)
		@invoice_item_4 = create(:invoice_item, quantity: 1, unit_price: @item_2.unit_price, item_id: @item_2.id, invoice_id: @invoice_4.id)
		@invoice_item_5 = create(:invoice_item, quantity: 1, unit_price: @item_1.unit_price, item_id: @item_1.id, invoice_id: @invoice_5.id)
		@invoice_item_6 = create(:invoice_item, quantity: 1, unit_price: @item_6.unit_price, item_id: @item_6.id, invoice_id: @invoice_6.id)
		@invoice_item_7 = create(:invoice_item, quantity: 1, unit_price: @item_7.unit_price, item_id: @item_7.id, invoice_id: @invoice_6.id)
		@invoice_item_8 = create(:invoice_item, quantity: 1, unit_price: @item_8.unit_price, item_id: @item_8.id, invoice_id: @invoice_6.id)

		@transaction_1 = create(:transaction, invoice_id: @invoice_1.id)
		@transaction_2 = create(:transaction, invoice_id: @invoice_2.id)
		@transaction_3 = create(:transaction, invoice_id: @invoice_3.id)
		@transaction_4 = create(:transaction, invoice_id: @invoice_4.id)
		@transaction_5 = create(:transaction, invoice_id: @invoice_5.id)
		@transaction_6 = create(:transaction, invoice_id: @invoice_6.id)
	end

  it "returns items with most revenue" do

    get '/api/v1/items/most_revenue?quantity=3'

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(items.count).to eq(3)
		expect(items[0]["id"]).to eq(@item_6.id.to_s)
		expect(items[1]["id"]).to eq(@item_7.id.to_s)
		expect(items[2]["id"]).to eq(@item_8.id.to_s)
  end

	it "returns items with most quantity sold" do

		get '/api/v1/items/most_items?quantity=2'

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(items.count).to eq(2)
		expect(items[0]["id"]).to eq(@item_1.id.to_s)
		expect(items[1]["id"]).to eq(@item_2.id.to_s)
	end

	it "returns best day for single item" do

		get "/api/v1/items/#{@item_1.id}/best_day"

		best_day = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(best_day["attributes"]["best_day"]).to eq("2019-08-18")
	end
end
