class Admin::ShopsController < ApplicationController
	before_action :authorized
	def index
    	@shops = Shop.all
  	end
end
