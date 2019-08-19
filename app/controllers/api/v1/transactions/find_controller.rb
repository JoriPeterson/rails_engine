class Api::V1::Transactions::FindController < ApplicationController

	def index
		transactions = Transaction.where(transaction_params).order(id: :asc)
		render json: TransactionSerializer.new(transactions)
	end

	def show
		render json: TransactionSerializer.new(Transaction.find_by(transaction_params))
	end

	private

	def transaction_params
		params.permit(:id, :credit_card_number, :result, :invoice_id, :created_at, :updated_at)
	end
end
