require 'csv'

task import: :environment do
    CSV.foreach('db/csv_data/merchants.csv', headers: true) do |row|
      Merchant.create!(row.to_hash)
    end
  end
