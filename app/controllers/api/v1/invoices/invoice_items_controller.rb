class Api::V1::Invoices::InvoiceItemsController < ApplicationController

	def show
		invoice = Invoice.find(params[:id])
		render json: InvoiceItemSerializer.new(invoice.invoice_items)
	end
end
