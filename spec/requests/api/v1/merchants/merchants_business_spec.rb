require 'rails_helper'

describe "Merchant Business Logic" do
	before :each do

	end
  it "returns merchants with most revenue" do
    create_list(:merchant, 10)

    get '/api/v1/merchants/most_revenue?quantity=5'

		merchants = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		# expect(Merchant.most_revenue(5)).to eq(5)
  end
end
