class ProfilesController < ApplicationController
# => @author John Murphy, x14124807
# => @date 13/09/2015
#
# => All classes, models, controllers and views have been built and modified based
# => on the 'Treebook' tutorials at teamtreehouse.com by Jason Seifer and Jim Hoskins.
# => @reference https://github.com/jasonseifer/treebook
# => @reference http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application  
  
  before_filter :authenticate_user!
  
  def show
    @user = User.find_by_profile_name(params[:id])
    if @user 
      @statuses = @user.statuses.all
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end
end

