class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!
	protect_from_forgery with: :exception
	layout :layout_by_resource
  
  	def after_sign_in_path_for(resource)
   		leave_summary_path
	  end
  
  
 	def layout_by_resource
       	if devise_controller? && resource_name == :user && action_name == 'new'
      		"devise"
    	else
      		"application"
    	end
  	end
end
