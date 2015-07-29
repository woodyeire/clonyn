class ApplicationController < ActionController::Base

before_filter :configure_permitted_parameters, if: :devise_controller?                                                                                                                   

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit :first_name, :last_name, :password_confirmation, :password, :email
    end 
  end 















#        before_filter :configure_permitted_parameters, if: :devise_controller?
#        
#            protected
#        
#            def configure_permitted_parameters
#             devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :profile_name
#            end
#          
#                protect_from_forgery
end

