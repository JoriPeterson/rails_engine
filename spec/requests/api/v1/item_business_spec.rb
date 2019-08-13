require 'rails_helper'

describe "Item Business Logic" do
	# before :each do
	# 	@merchant = Merchant.create!(name: "Rubber Duckies")
	# 	@item_1 = @merchant.items.create!(name: "Elvis Ducky", description: "Elvis", unit_price: 5.99, merchant_id: @merchant.id)
	# 	@item_2 = @merchant.items.create!(name: "Zombie Ducky", description: "Zombie", unit_price: 7.99, merchant_id: @merchant.id)
	# 	@item_3 = @merchant.items.create!(name: "Bathtime Ducky", description: "Bathtime", unit_price: 5.99, merchant_id: @merchant.id)
	# 	@item_4 = @merchant.items.create!(name: "Lipstick Ducky", description: "Lipstick", unit_price: 4.99, merchant_id: @merchant.id)
	# 	@item_5 = @merchant.items.create!(name: "Tay Ducky", description: "Tay", unit_price: 10.99, merchant_id: @merchant.id)
	# 	@item_6 = @merchant.items.create!(name: "Sejin Ducky", description: "Sejin", unit_price: 0.99, merchant_id: @merchant.id)
	# 	@customer = Customer.create!(first_name: "Jori", last_name: "Peterson")
	# end

  it "returns items with most revenue" do

    get '/api/v1/items/most_revenue?quantity=5'

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(merchants.most_revenue).to eq(5)
  end
end
