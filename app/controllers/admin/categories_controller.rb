class Admin::CategoriesController < ApplicationController
	before_action :authorized
	def index
    	@categories = Category.all
  	end
end
