require 'rails_helper'

describe "InvoiceItems API" do
  it "sends a list of invoice items" do
		create_list(:invoice_item, 4)
    get '/api/v1/invoice_items'

		invoice_items = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoice_items.count).to eq(4)
  end

	it "can get one item by its id" do
		id = create(:invoice_item).id

		get "/api/v1/invoice_items/#{id}"

		invoice_item = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoice_item["id"]).to eq(id.to_s)
	end

	it "can use finder to return single object by unit_price" do
		invoice_item = create(:invoice_item)

		get "/api/v1/invoice_items/find?unit_price=20.00"

		new_invoice_item = JSON.parse(response.body)

		expect(response).to be_successful
		expect('%.2f' % (invoice_item.unit_price.to_f/100)).to eq(new_invoice_item["data"]["attributes"]["unit_price"])
	end

	it "can use finder to return single object by unit_price" do
		invoice_item = create(:invoice_item)

		get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

		new_invoice_item = JSON.parse(response.body)

		expect(response).to be_successful
		expect(invoice_item.quantity).to eq(new_invoice_item["data"]["attributes"]["quantity"])
	end

	it "can use finder to return multiple objects by quantity" do
		invoice_item_1 = create(:invoice_item, quantity: 2)
		invoice_item_2 = create(:invoice_item, quantity: 2)

		get "/api/v1/invoice_items/find?invoice_id=2"

		invoice_items = JSON.parse(response.body)

		expect(response).to be_successful
		# expect(invoice_items.count).to eq(2)
	end
end
