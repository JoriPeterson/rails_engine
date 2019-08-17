class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

	def show
		merchant = Merchant.find(params[:id])
		favorite = merchant.favorite_customer
		render json: {"data" => {"attributes" => {"id" => favorite[0]["customer_id"]}}}
	end
end
