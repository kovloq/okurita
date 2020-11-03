class Admin::UsersController < ApplicationController
  before_action :authorized

	def index
		
    	@users = User.order(:id => :desc).page(params[:page]).per(10)
  	end

  	def new
  		@user=User.new
  		@country=Country.all
  	end

  	def create
  		params[:user][:encrypted_password]=Digest::MD5.hexdigest(params[:user][:password])
  		@user = User.new(user_params)
    	respond_to do |format|
	      if @user.save
	        format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
	        # format.json { render :show, status: :created, location: @user }
	      else
	      	@country=Country.all
	        format.html { render :new }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def update
  		@user=User.find params[:id]
  		respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to admin_users_url, notice: 'User was successfully updated.' }
	        format.json { render :show, status: :ok, location: @user }
	      else
	      	@country=Country.all
	        format.html { render :edit }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def edit
  		@user = User.find(params[:id])
  		@country=Country.all
  	end

  	def destroy
  		@user=User.find params[:id]
      	@user.destroy
      	flash[:success]="Deleted"
      	redirect_to admin_users_url
  	end

  	private
  	

	def user_params
	   params.require(:user).permit(:remember_created_at ,:name, :reset_password_sent_at,:reset_password_token,:encrypted_password,:email,:is_newsletter,:country_id)
	end
end
