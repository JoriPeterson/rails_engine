class Api::V1::Merchants::RevenueController < ApplicationController

	def index
		revenue = Merchant.revenue_by_date(params[:date])
		# binding.pry
		render json: RevenueSerializer.new(revenue)
	end
end
