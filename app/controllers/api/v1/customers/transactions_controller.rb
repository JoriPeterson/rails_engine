class Api::V1::Customers::TransactionsController < ApplicationController

	def show
		customer = Customer.find(params[:id])
		render json: TransactionSerializer.new(customer.transactions)
	end
end
