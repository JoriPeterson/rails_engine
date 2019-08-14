require 'rails_helper'

describe "Item Business Logic" do
	before :each do
		@item_1 = create(:item, price: 8.0)
		@item_2 = create(:item, price: 7.0) 
	end

  it "returns items with most revenue" do
		# create_list(:invoice, 5)
		# create_list(:invoice_item, 5)

    get '/api/v1/items/most_revenue?quantity=2'

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		# expect(items.count).to eq(2)
  end
end
