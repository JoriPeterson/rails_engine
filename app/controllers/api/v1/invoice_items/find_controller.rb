class Api::V1::InvoiceItems::FindController < ApplicationController

	def index
		invoice_items = InvoiceItem.where(invoice_item_params).order(id: :asc)
		render json: InvoiceItemSerializer.new(invoice_items)
	end

	def show
		render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_item_params))
	end

	private

	def invoice_item_params
		if params[:unit_price]
			params[:unit_price] = (params[:unit_price].to_f*100).round(0)
		end
		params.permit(:id, :item_id, :invoice_id, :unit_price, :quantity, :created_at, :updated_at)
	end
end
