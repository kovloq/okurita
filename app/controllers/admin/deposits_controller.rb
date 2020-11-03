class Admin::DepositsController < ApplicationController
	before_action :authorized
	def index
    	@deposits = Deposit.all
  	end
end
