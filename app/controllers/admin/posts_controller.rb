class Admin::PostsController < ApplicationController
	before_action :authorized
	def index
    	@posts = Post.all
  	end
end
