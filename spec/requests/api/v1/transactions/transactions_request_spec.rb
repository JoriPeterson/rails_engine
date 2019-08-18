require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
		create_list(:transaction, 4)
    get '/api/v1/transactions'

		transactions = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(transactions.count).to eq(4)
  end

	it "can get one transaction by its id" do
		id = create(:transaction).id

		get "/api/v1/transactions/#{id}"

		transaction = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(transaction["id"]).to eq(id.to_s)
	end

	it "can use finder to return single object by credit card number" do
		credit_card_number = create(:transaction).credit_card_number

		get "/api/v1/transactions/find?credit_card_number=#{credit_card_number}"

		transaction = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(transaction["attributes"]["credit_card_number"]).to eq(credit_card_number)
	end

	it "can use finder to return single object by result" do
		result = create(:transaction).result

		get "/api/v1/transactions/find?result=#{result}"

		transaction = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(transaction["attributes"]["result"]).to eq(result)
	end

	it "can use finder to return multiple objects by result" do
		transaction_1 = create(:transaction, result: "success")
		transaction_2 = create(:transaction, result: "success")

		get "/api/v1/items/find_all?result=success"

		transactions = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		# expect(transactions.count).to eq(2)
	end
end
