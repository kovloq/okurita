class Admin::NewsController < ApplicationController
	def index
    	@news = News.all
  	end

  	def new
  		@news = News.new
 
		
  	end

  	def create
  		@news = News.new(params[:news])
 
		
  	end

  	def show
  		@news = News.find(params[:id])
 
		
  	end

  	def edit

  	end

  	def update

  	end

  	def destroy

  	end
end
