require 'csv'

namespace :import do
	task import_csv: :environment do
	  CSV.foreach('db/csv_data/merchants.csv', headers: true) do |row|
	    Merchant.create!(row.to_hash)
	  end

		CSV.foreach('db/csv_data/items.csv', headers: true) do |row|
			Item.create!(row.to_hash)
		end

		CSV.foreach('db/csv_data/customers.csv', headers: true) do |row|
			Customer.create!(row.to_hash)
		end

	  CSV.foreach('db/csv_data/invoices.csv', headers: true) do |row|
	    Invoice.create!(row.to_hash)
	  end

		CSV.foreach('db/csv_data/invoice_items.csv', headers: true) do |row|
			InvoiceItem.create!(row.to_hash)
		end

		CSV.foreach('db/csv_data/transactions.csv', headers: true) do |row|
			Transaction.create!(row.to_hash)
		end
	end
end
