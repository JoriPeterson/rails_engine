Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace :api do
    namespace :v1 do
			namespace :merchants do
				get '/find', to: 'find#show'
				get '/find_all', to: 'find#index'
				get '/most_revenue', to: 'most_revenue#index'
				get '/most_items', to: 'most_items#index'
				get '/revenue', to: 'revenue#index'
				get '/:id/revenue', to: 'revenue#show'
		 	end
			namespace :items do
				get '/find', to: 'find#show'
				get '/find_all', to: 'find#index'
				get '/most_revenue', to: 'most_revenue#index'
			end
			namespace :invoices do
				get '/find', to: 'find#show'
				get '/find_all', to: 'find#index'
			end
			resources :merchants, only: [:index, :show]
			resources :items, only: [:index, :show]
			resources :invoices, only: [:index, :show]
	 	end
 	end
end
