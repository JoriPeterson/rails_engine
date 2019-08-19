require 'rails_helper'

describe "Transaction Relationships" do
  it "sends a invoice transaction belongs to" do

		invoice = create(:invoice)
		transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

		invoice_1 = JSON.parse(response.body)["data"]

		expect(response).to be_successful
		expect(invoice_1["id"]).to eq(invoice.id.to_s)
  end
end
