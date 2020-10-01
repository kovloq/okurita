Rails.application.routes.draw do
  devise_for :users
  # 
  get 'auction', to: 'yauction#index'
  get 'auction/category/:id', to: 'yauction#category',as: "auction_category"

  namespace :admin do
  		get '/', to: 'home#index'
		resources :users
		# resources :contents
		resources :orders
		resources :categories
		resources :products
		resources :news
		resources :faqs
		resources :deposits
		resources :refunds
		resources :posts
	end	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
