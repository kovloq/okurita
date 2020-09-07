class Admin::ShippingsController < ApplicationController
	def index
    	@shippings = Shipping.all
  	end
end
