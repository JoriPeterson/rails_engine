require 'rails_helper'

RSpec.describe Item do
  describe 'Relationships' do
    it {should belong_to :merchant}
		it {should have_many :invoice_items}
    it {should have_many(:invoices).through(:invoice_items)}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :unit_price}
  end

	describe 'Instance Methods' do
		before :each do

			@item_1 = create(:item, name: "Banana", unit_price: 500)
			@item_2 = create(:item, name: "Apple", unit_price: 500)
			@item_3 = create(:item, name: "Grape", unit_price: 1000)
			@item_4 = create(:item, name: "Strawberry", unit_price: 1000)
			@item_5 = create(:item, name: "Blueberry", unit_price: 1500)
			@item_6 = create(:item, name: "Peach", unit_price: 6050)
			@item_7 = create(:item, name: "Plum", unit_price: 5000)
			@item_8 = create(:item, name: "Kiwi", unit_price: 4000)

			@invoice_1 = create(:invoice, created_at: "2019-08-18")
			@invoice_2 = create(:invoice, created_at: "2019-08-18")
			@invoice_3 = create(:invoice, created_at: "2019-08-18")
			@invoice_4 = create(:invoice, created_at: "2019-08-18")
			@invoice_5 = create(:invoice, created_at: "2019-08-18")
			@invoice_6 = create(:invoice, created_at: "2019-08-18")

			@invoice_item_1 = create(:invoice_item, quantity: 1, unit_price: @item_1.unit_price, item_id: @item_1.id, invoice_id: @invoice_1.id)
			@invoice_item_2 = create(:invoice_item, quantity: 1, unit_price: @item_1.unit_price, item_id: @item_1.id, invoice_id: @invoice_2.id)
			@invoice_item_3 = create(:invoice_item, quantity: 1, unit_price: @item_2.unit_price, item_id: @item_2.id, invoice_id: @invoice_3.id)
			@invoice_item_4 = create(:invoice_item, quantity: 1, unit_price: @item_2.unit_price, item_id: @item_2.id, invoice_id: @invoice_4.id)
			@invoice_item_5 = create(:invoice_item, quantity: 1, unit_price: @item_1.unit_price, item_id: @item_1.id, invoice_id: @invoice_5.id)
			@invoice_item_6 = create(:invoice_item, quantity: 1, unit_price: @item_6.unit_price, item_id: @item_6.id, invoice_id: @invoice_6.id)
			@invoice_item_7 = create(:invoice_item, quantity: 1, unit_price: @item_7.unit_price, item_id: @item_7.id, invoice_id: @invoice_6.id)
			@invoice_item_8 = create(:invoice_item, quantity: 1, unit_price: @item_8.unit_price, item_id: @item_8.id, invoice_id: @invoice_6.id)

			@transaction_1 = create(:transaction, invoice_id: @invoice_1.id)
			@transaction_2 = create(:transaction, invoice_id: @invoice_2.id)
			@transaction_3 = create(:transaction, invoice_id: @invoice_3.id)
			@transaction_4 = create(:transaction, invoice_id: @invoice_4.id)
			@transaction_5 = create(:transaction, invoice_id: @invoice_5.id)
			@transaction_6 = create(:transaction, invoice_id: @invoice_6.id)
		end

		it 'can find x number of items with most revenue' do
			expect(Item.most_revenue(3)).to eq([@item_6, @item_7, @item_8])
		end

		it 'can find x number of items most sold' do
			expect(Item.most_items(1)).to eq([@item_1])
			expect(Item.most_items(2)).to eq([@item_1, @item_2])
		end

		it 'can find best day for a single item' do
			expect(@item_1.best_day[0]["created_at"]).to eq("2019-08-18")
		end
	end
end
