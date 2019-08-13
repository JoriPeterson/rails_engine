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

	it "can_use_finder_to_return_single_object" do
		merchant = create(:merchant)

		get "/api/v1/merchants/search/find?name=#{merchant.name}"

		new_merchant = JSON.parse(response.body)

		expect(response).to be_successful
		expect(merchant.name).to eq(new_merchant["data"]["attributes"]["name"])
	end
end
