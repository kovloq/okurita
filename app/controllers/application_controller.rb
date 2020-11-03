class ApplicationController < ActionController::Base
	helper_method :current_admin
	# before_action :authorized
	helper_method :logged_in?
	def current_admin        
		Administrator.find_by(id: session[:admin_id])  
	end

	def logged_in?
       
    	!current_admin.nil?end

	def authorized   
		redirect_to admin_login_path unless logged_in?
	end
end
