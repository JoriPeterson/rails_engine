class Api::V1::InvoiceItems::ItemsController < ApplicationController

	def show
		invoice_item = InvoiceItem.find(params[:id])
		render json: ItemSerializer.new(invoice_item.item)
	end
end
