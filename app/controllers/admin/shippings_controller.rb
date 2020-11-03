class Admin::ShippingsController < ApplicationController
	before_action :authorized
	def index
    	@shippings = Shipping.all
  	end
end
