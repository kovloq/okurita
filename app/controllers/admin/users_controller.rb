class Admin::UsersController < ApplicationController
	def index
		
    	@users = User.order(:id => :desc).page(params[:page]).per(10)
  	end

  	def new
  		@user=User.new
  		@country=Country.all
  	end

  	def create
  		@user = User.new(user_params)
    	@user.save
  	end

  	def update
  		@user = User.find(params[:id])
  		@user.update_attributes(user_params)
  	end

  	def edit
  		@user = User.find(params[:id])
  	end

  	def destroy
  		@user=User.find params[:id]
      	@user.destroy
      	flash[:success]="Deleted"
      	redirect_to :controller => "user", :action => "index"
  	end

  	private
	def user_params
	   params.require(:user).permit(:name, :category_id,:date,:description,:member_id,:amount,:t_category)
	end
end
