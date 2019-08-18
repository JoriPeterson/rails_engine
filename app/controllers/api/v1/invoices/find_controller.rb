class Api::V1::Invoices::FindController < ApplicationController

	def index
		invoices = Invoice.where(invoice_params).order(id: :asc)
		render json: InvoiceSerializer.new(invoices)
	end

	def show
		render json: InvoiceSerializer.new(Invoice.find_by(invoice_params))
	end

	private

	def invoice_params
		params.permit(:id, :status, :merchant_id, :customer_id, :created_at, :updated_at)
	end
end
