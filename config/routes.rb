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
				get '/:id/favorite_customer', to: 'favorite_customer#show'
				get '/:id/items', to: 'items#show'
				get '/:id/invoices', to: 'invoices#show'
		 	end
			namespace :items do
				get '/find', to: 'find#show'
				get '/find_all', to: 'find#index'
				get '/most_revenue', to: 'most_revenue#index'
				get '/:id/invoices_items', to: 'invoices_items#show'
				get '/:id/merchant', to: 'merchants#show'
			end
			namespace :invoices do
				get '/find', to: 'find#show'
				get '/find_all', to: 'find#index'
				get '/:id/transactions', to: 'transactions#show'
				get '/:id/invoice_items', to: 'invoice_items#show'
				get '/:id/items', to: 'items#show'
				get '/:id/customer', to: 'customers#show'
				get '/:id/merchant', to: 'merchants#show'
			end
			namespace :invoice_items do
				get '/find', to: 'find#show'
				get '/find_all', to: 'find#index'
				get '/:id/invoice', to: 'invoices#show'
				get '/:id/items', to: 'items#show'
			end
			namespace :transactions do
				get '/find', to: 'find#show'
				get '/find_all', to: 'find#index'
				get '/:id/invoice', to: 'invoices#show'
			end
			namespace :customers do
				get '/find', to: 'find#show'
				get '/find_all', to: 'find#index'
				get '/:id/invoices', to: 'invoices#show'
				get '/:id/transactions', to: 'transactions#show'
			end
			resources :merchants, only: [:index, :show]
			resources :items, only: [:index, :show]
			resources :invoices, only: [:index, :show]
			resources :invoice_items, only: [:index, :show]
			resources :transactions, only: [:index, :show]
			resources :customers, only: [:index, :show]
	 	end
 	end
end
