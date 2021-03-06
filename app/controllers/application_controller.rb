class ApplicationController < ActionController::Base

# => @author John Murphy, x14124807
# => @date 13/09/2015
#
# => All classes, models, controllers and views have been built and modified based
# => on the 'Treebook' tutorials at teamtreehouse.com by Jason Seifer and Jim Hoskins.
# => @reference https://github.com/jasonseifer/treebook
# => @reference http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application

before_filter :configure_permitted_parameters, if: :devise_controller?
        
  protected
        
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :profile_name
    end
          
    protect_from_forgery
end