class Api::V1::Items::FindController < ApplicationController

	def index
		render json: ItemSerializer.new(Item.order_by_id.where(item_params))
	end

	def show
		render json: ItemSerializer.new(Item.order_by_id.find_by(item_params))
	end

	private

	def item_params
		if params[:unit_price]
			params[:unit_price] = (params[:unit_price].to_f*100).round(0)
		end
		params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
	end
end
