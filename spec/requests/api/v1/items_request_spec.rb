require 'rails_helper'

describe "Items API" do
	before :each do
		@merchant = Merchant.create!(name: "Rubber Duckies")
		@item_1 = @merchant.items.create!(name: "Elvis Ducky", description: "Elvis", unit_price: 5.99, merchant_id: @merchant.id)
		@item_2 = @merchant.items.create!(name: "Zombie Ducky", description: "Zombie", unit_price: 7.99, merchant_id: @merchant.id)
		@item_3 = @merchant.items.create!(name: "Bathtime Ducky", description: "Bathtime", unit_price: 5.99, merchant_id: @merchant.id)
		@item_4 = @merchant.items.create!(name: "Lipstick Ducky", description: "Lipstick", unit_price: 4.99, merchant_id: @merchant.id)
		@item_5 = @merchant.items.create!(name: "Tay Ducky", description: "Tay", unit_price: 10.99, merchant_id: @merchant.id)
		@item_6 = @merchant.items.create!(name: "Sejin Ducky", description: "Sejin", unit_price: 0.99, merchant_id: @merchant.id)
	end
  it "sends a list of items" do

    get '/api/v1/items'

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(items.count).to eq(6)
  end

	it "can get one item by its id" do

		get "/api/v1/items/#{@item_1.id}"

		item = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(item["id"]).to eq("#{@item_1.id}".to_s)
	end
end
