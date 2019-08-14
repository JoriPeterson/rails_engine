require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

		merchants = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(merchants.count).to eq(3)
  end

	it "can get one item by its id" do
		id = create(:merchant).id

		get "/api/v1/merchants/#{id}"

		merchant = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(merchant["id"]).to eq(id.to_s)
	end

	it "can use finder to return single object by name" do
		merchant = create(:merchant)

		get "/api/v1/merchants/find?name=#{merchant.name}"

		new_merchant = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchant.name).to eq(new_merchant["data"]["attributes"]["name"])
	end

	it "can use finder to return single object by id" do
		merchant = create(:merchant)

		get "/api/v1/merchants/find?id=#{merchant.id}"

		new_merchant = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchant.id).to eq(new_merchant["data"]["attributes"]["id"])
	end

	it "can use finder to return single object by time created" do
		merchant = Merchant.create(name: "Banana Stand", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

		get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

		new_merchant = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchant.created_at).to eq("2012-03-27 14:53:59 UTC")
	end

	it "can use finder to return single object by time updated" do
		merchant = Merchant.create(name: "Banana Stand", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")

		get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

		new_merchant = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchant.updated_at).to eq("2012-03-27 14:53:59 UTC")
	end

	it "can use finder to return multiple objects by name" do
		merchant_1 = Merchant.create(name: "Bananas", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC")
		merchant_2 = Merchant.create(name: "Bananas", created_at: "2015-03-27 14:53:59 UTC", updated_at: "2017-03-27 14:53:59 UTC")

		get "/api/v1/merchants/find_all?name=Bananas"

		merchants = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(merchants.count).to eq(2)
	end
end
