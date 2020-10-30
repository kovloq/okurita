Rails.application.routes.draw do
  # resources :administrators
  devise_for :users
  # 
  get 'auction', to: 'yauction#index'
  get 'auction/category/:id', to: 'yauction#category',as: "auction_category"
  get 'auction/detail/:id', to: 'yauction#detail',as: "auction_detail"
  get 'rakuten', to: 'rakuten#index'
  get 'rakuten/category/:id', to: 'rakuten#category',as: "rakuten_category"
  get 'rakuten/detail/:id', to: 'rakuten#detail',as: "rakuten_detail"
  get 'shopping', to: 'yshopping#index'
  get 'shopping/category/:id', to: 'yshopping#category',as: "shopping_category"
  get 'shopping/detail/:id', to: 'yshopping#detail',as: "shopping_detail"
  get 'amazon', to: 'amazon#index'
  get 'amazon/category/:id', to: 'amazon#category',as: "amazon_category"
  get 'amazon/detail/:id', to: 'amazon#detail',as: "amazon_detail"

  namespace :admin do
  	get '/', to: 'home#index'
    get 'login', to: 'admin#login'
    get 'post', to: 'admin#login_post'
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
