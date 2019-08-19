class Api::V1::Customers::InvoicesController < ApplicationController

	def show
		# binding.pry
		customer = Customer.find(params[:id])
		render json: InvoiceSerializer.new(customer.invoices)
	end
end
