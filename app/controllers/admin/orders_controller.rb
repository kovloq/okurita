class Admin::OrdersController < ApplicationController
	before_action :authorized
	def index
		@ordes=Order.all
	end
end
