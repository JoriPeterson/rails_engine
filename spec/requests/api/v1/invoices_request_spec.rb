require 'rails_helper'

describe "Invoices API" do
  it "sends a list of invoices" do
		create_list(:invoice, 6)
    get '/api/v1/invoices'

		invoices = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoices.count).to eq(6)
  end

	it "can get one item by its id" do
		id = create(:invoice).id

		get "/api/v1/invoices/#{id}"

		invoice = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoice["id"]).to eq(id.to_s)
	end

	it "can use finder to return single object by status" do
		status = create(:invoice).status

		get "/api/v1/invoices/find?status=#{status}"

		invoice = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoice["attributes"]["status"]).to eq(status)
	end

	it "can use finder to return single object by description" do
		invoice = create(:invoice)

		get "/api/v1/invoices/find?unit_price=#{invoice.status}"

		new_invoice = JSON.parse(response.body)

		expect(response).to be_successful
		expect(invoice.status).to eq(new_invoice["data"]["attributes"]["status"])
	end
end
