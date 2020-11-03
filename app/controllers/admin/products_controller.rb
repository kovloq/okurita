class Admin::ProductsController < ApplicationController
	before_action :authorized
	def index
    	@products = Product.all
  	end
end
