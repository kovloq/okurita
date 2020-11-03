class Admin::AuthController < ApplicationController
	layout false
	def index
		
	end

	def login
		@administrator=Administrator.new
	end

	def login_post
		# params.to_yaml
		email=params["administrator"]["email"]
		password=params["administrator"]["password"]
		
		admin = Administrator.find_by_email(email)
		# @debug=password;
	    if admin && admin.authenticate(password)
	      session[:admin_id] = admin.id
	      cookies.signed[:admin_id] = { value: admin.id, expires: 2.weeks.from_now }
	      redirect_to admin_url, notice: "Logged in!"
	    else
	      flash[:alert] = "Email or password is invalid"
	      redirect_to admin_login_path
	      # @administrator=Administrator.new
	      # render "login";
	    end
	end

	def logout
		session[:admin_id] = nil
		cookies.delete :admin_id
    	redirect_to admin_login_path, notice: "Logged out!"
	end

	private

	def admins_params
     params.require(:administrator).permit(:email ,:password)
    end

end
