class Api::V1::Invoices::ItemsController < ApplicationController

	def show
		invoice = Invoice.find(params[:id])
		render json: ItemSerializer.new(invoice.items)
	end
end
