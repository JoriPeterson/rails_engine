require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
		create_list(:item, 6)
    get '/api/v1/items'

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(items.count).to eq(6)
  end

	it "can get one item by its id" do
		id = create(:item).id

		get "/api/v1/items/#{id}"

		item = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(item["id"]).to eq(id.to_s)
	end

	it "can use finder to return single object by name" do
		name = create(:item).name

		get "/api/v1/items/find?name=#{name}"

		item = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(item["attributes"]["name"]).to eq(name)
	end

	it "can use finder to return single object by id" do
		item = create(:item)

		get "/api/v1/items/find?id=#{item.id}"

		new_item = JSON.parse(response.body)

		expect(response).to be_successful
		expect(item.id).to eq(new_item["data"]["attributes"]["id"])
	end

	it "can use finder to return single object by description" do
		item = create(:item)

		get "/api/v1/items/find?description=#{item.description}"

		new_item = JSON.parse(response.body)

		expect(response).to be_successful
		expect(item.description).to eq(new_item["data"]["attributes"]["description"])
	end

	it "can use finder to return single object by unit_price" do
		item = create(:item, unit_price: 4000)

		get "/api/v1/items/find?unit_price=40.00"

		new_item = JSON.parse(response.body)

		expect(response).to be_successful
		expect('%.2f' % (item.unit_price.to_f/100)).to eq(new_item["data"]["attributes"]["unit_price"])
	end

	it "can use finder to return multiple objects by name" do
		item_1 = create(:item, name: "banana")
		item_2 = create(:item, name: "banana")

		get "/api/v1/items/find_all?name=banana"

		items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(items.count).to eq(2)
	end
end
