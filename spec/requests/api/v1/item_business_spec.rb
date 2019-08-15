require 'rails_helper'

describe "Item Business Logic" do
	before :each do
		@item_1 = create(:item, unit_price: 8.0)
		@item_2 = create(:item, unit_price: 7.0)
		@item_3 = create(:item, unit_price: 9.0)
		# @invoice_item_1 = create(:invoice_item, quantity: 2, item_id: @item_1)
		# @invoice_item_2 = create(:invoice_item, quantity: 7, item_id: @item_2)
		# @invoice_item_3 = create(:invoice_item, quantity: 10, item_id: @item_3)
	end

  it "returns items with most revenue" do
		create_list(:invoice, 5)
		create_list(:invoice_item, 5)

    get '/api/v1/items/most_revenue?quantity=2'

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(items.count).to eq(2)
		expect(items.most_revenue(2)).to eq([@item_3, @item_1])
  end
end
