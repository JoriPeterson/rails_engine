require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
		create_list(:customer, 6)
    get '/api/v1/customers'

		customers = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(customers.count).to eq(6)
  end

	it "can get one customer by its id" do
		id = create(:customer).id

		get "/api/v1/customers/#{id}"

		customer = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(customer["id"]).to eq(id.to_s)
	end

	it "can use finder to return single customer by first_name" do
		first_name = create(:customer).first_name

		get "/api/v1/customers/find?first_name=#{first_name}"

		customer = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(customer["attributes"]["first_name"]).to eq(first_name)
	end

	it "can use finder to return single customer by last_name" do
		last_name = create(:customer).last_name

		get "/api/v1/customers/find?last_name=#{last_name}"

		customer = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(customer["attributes"]["last_name"]).to eq(last_name)
	end

	it "can use finder to return multiple objects by first_name" do
		customer_1 = create(:customer, first_name: "charter")
		customer_2 = create(:customer, first_name: "charter")

		get "/api/v1/customers/find_all?first_name=charter"

		customers = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(customers.count).to eq(2)
	end
end
