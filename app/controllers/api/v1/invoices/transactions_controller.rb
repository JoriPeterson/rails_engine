class Api::V1::Invoices::TransactionsController < ApplicationController

	def show
		invoice = Invoice.find(params[:id])
		render json: TransactionSerializer.new(invoice.transactions)
	end
end
