class Admin::RefundsController < ApplicationController
	def index
    	@refunds = Refund.all
  	end
end
