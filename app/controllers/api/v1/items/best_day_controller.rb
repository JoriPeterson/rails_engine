class Api::V1::Items::BestDayController < ApplicationController

	def show
		item = Item.find(params[:id])
		date = item.best_day
		render json: {"data" => {"attributes" => {'best_day' => date[0]["created_at"].to_date }}}
	end
end
