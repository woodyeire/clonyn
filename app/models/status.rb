class Status < ActiveRecord::Base
# => @author John Murphy, x14124807
# => @date 13/09/2015
#
# => All classes, models, controllers and views have been built and modified based
# => on the 'Treebook' tutorials at teamtreehouse.com by Jason Seifer and Jim Hoskins.
# => @reference https://github.com/jasonseifer/treebook
# => @reference http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application
  attr_accessible :content, :user_id
  belongs_to :user
  
  validates :content, presence: true,
                      length: {minimum: 2}
                      
  validates :user_id, presence: true

end
