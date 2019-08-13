Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'api/v1/merchants/most_revenue'

	namespace :api do
    namespace :v1 do
			namespace :merchants do
				get '/search/find', to: 'search#show'
				get '/search/find_all', to: 'search#index'
		 	end
			namespace :items do
				get '/most_revenue', to: 'most_revenue#index'
			end
			resources :merchants, only: [:index, :show]
			resources :items, only: [:index, :show]
	 	end
 	end
end
