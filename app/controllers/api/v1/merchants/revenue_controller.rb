class Api::V1::Merchants::RevenueController < ApplicationController

	def index
		rev = Merchant.revenue_by_date(params[:date])
		render json: {"data" => {"attributes" => {'total_revenue' => '%.2f' % (rev.to_f / 100)}}}
	end

	def show
		merchant = Merchant.find(params[:id])
		if params[:date]
			rev = merchant.single_revenue_by_date(params[:date])
		else
			rev = merchant.total_revenue
		end
		render json: {"data" => {"attributes" => {'revenue' => '%.2f' % (rev.to_f / 100)}}}
	end
end
