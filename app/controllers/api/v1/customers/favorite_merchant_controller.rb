class Api::V1::Customers::FavoriteMerchantController < ApplicationController

	def show
		customer = Customer.find(params[:id])
		favorite = customer.favorite_merchant
		render json: {"data" => {"attributes" => favorite[0]}}
	end
end
