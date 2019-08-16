# require 'csv'
#
# namespace :import do
# 	task transactions: :environment do
# 		CSV.foreach('db/csv_data/transactions.csv', headers: true) do |row|
# 			Transaction.create!(row.to_hash)
# 		end
# 	end
# end
