class Api::V1::Items::MostRevenueController < ApplicationController

	def index
		# binding.pry
		render json: ItemSerializer.new(Item.most_revenue(params[:quantity.to_i]))
	end

end
