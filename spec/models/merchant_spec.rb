require 'rails_helper'

RSpec.describe Merchant do
  describe 'Relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
  end

	describe "Instance Methods"
		before :each do
			@merchant_1 = create(:merchant, name: "Bananas")
			@merchant_2 = create(:merchant, name: "Oranges")
			@merchant_3 = create(:merchant, name: "Apples")

			@customer_1 = create(:customer)
			@customer_2 = create(:customer)
			@customer_3 = create(:customer)
			@customer_4 = create(:customer)
			@customer_5 = create(:customer)
			@customer_6 = create(:customer)

			@item_1 = create(:item, unit_price: 500, merchant_id: @merchant_1.id)
			@item_2 = create(:item, unit_price: 1000, merchant_id: @merchant_1.id)
			@item_3 = create(:item, unit_price: 1000, merchant_id: @merchant_2.id)
			@item_4 = create(:item, unit_price: 1000, merchant_id: @merchant_2.id)
			@item_5 = create(:item, unit_price: 1500, merchant_id: @merchant_2.id)
			@item_6 = create(:item, unit_price: 2000, merchant_id: @merchant_3.id)

			@invoice_1 = create(:invoice, merchant_id: @merchant_1.id, customer_id: @customer_1.id, created_at: "2019-08-18")
			@invoice_2 = create(:invoice, merchant_id: @merchant_1.id, customer_id: @customer_1.id, created_at: "2019-08-18")
			@invoice_3 = create(:invoice, merchant_id: @merchant_2.id, customer_id: @customer_3.id, created_at: "2019-08-18")
			@invoice_4 = create(:invoice, merchant_id: @merchant_2.id, customer_id: @customer_4.id, created_at: "2019-08-18")
			@invoice_5 = create(:invoice, merchant_id: @merchant_3.id, customer_id: @customer_5.id, created_at: "2019-08-18")
			@invoice_6 = create(:invoice, merchant_id: @merchant_3.id, customer_id: @customer_6.id, created_at: "2019-08-18")

			@invoice_item_1 = create(:invoice_item, quantity: 1, unit_price: @item_1.unit_price, item_id: @item_1.id, invoice_id: @invoice_1.id)
			@invoice_item_2 = create(:invoice_item, quantity: 1, unit_price: @item_2.unit_price, item_id: @item_2.id, invoice_id: @invoice_2.id)
			@invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: @item_3.unit_price, item_id: @item_3.id, invoice_id: @invoice_3.id)
			@invoice_item_4 = create(:invoice_item, quantity: 1, unit_price: @item_4.unit_price, item_id: @item_4.id, invoice_id: @invoice_4.id)
			@invoice_item_5 = create(:invoice_item, quantity: 1, unit_price: @item_5.unit_price, item_id: @item_5.id, invoice_id: @invoice_5.id)
			@invoice_item_6 = create(:invoice_item, quantity: 1, unit_price: @item_6.unit_price, item_id: @item_6.id, invoice_id: @invoice_6.id)

			@transaction_1 = create(:transaction, invoice_id: @invoice_1.id)
			@transaction_2 = create(:transaction, invoice_id: @invoice_2.id)
			@transaction_3 = create(:transaction, invoice_id: @invoice_3.id)
			@transaction_4 = create(:transaction, invoice_id: @invoice_4.id)
			@transaction_5 = create(:transaction, invoice_id: @invoice_5.id)
			@transaction_6 = create(:transaction, invoice_id: @invoice_6.id)
		end

		it "can find x number of merchants with most revenue" do
			expect(Merchant.most_revenue(2)).to eq([@merchant_3, @merchant_2])
		end

		it "can find x number of merchants with most items" do
			expect(Merchant.most_items(2)).to eq([@merchant_1, @merchant_2])
		end

		it "can find all merchants revenue by date" do
			expect(Merchant.revenue_by_date("2019-08-18")).to eq(7000)
		end

		it "can find total revenue of one merchant" do
			expect(@merchant_1.total_revenue).to eq(1500)
			expect(@merchant_2.total_revenue).to eq(2000)
		end

		it "can find one merchant's revenue by date" do
			expect(@merchant_1.single_revenue_by_date("2019-08-18")).to eq(1500)
			expect(@merchant_2.single_revenue_by_date("2019-08-18")).to eq(2000)
		end

		it "can find a single merchant's favorite customer" do
			expect(@merchant_1.favorite_customer[0].customer_id).to eq(@customer_1.id)
		end
end
