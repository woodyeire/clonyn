class User < ActiveRecord::Base
# => @author John Murphy, x14124807
# => @date 13/09/2015
#
# => All classes, models, controllers and views have been built and modified based
# => on the 'Treebook' tutorials at teamtreehouse.com by Jason Seifer and Jim Hoskins.
# => @reference https://github.com/jasonseifer/treebook
# => @reference http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :profile_name
  # attr_accessible :title, :body
  
  validates :first_name, presence: true
  
  validates :last_name, presence: true
 
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                            with: /^[a-zA-Z0-9_-]+$/,
                            message: 'Must be formatted correctly'
                           }
  

  has_many :statuses, :dependent => :destroy
  has_many :user_friendships
  has_many :friends, :through => :user_friendships,
                      conditions: { user_friendships: { state: 'accepted'}}
  
  has_many :pending_user_friendships, class_name: 'UserFriendship',
                                      foreign_key: :user_id,
                                      conditions: { state: 'pending' }
  has_many :pending_friends, through: :pending_user_friendships, source: :friend
  has_many :requested_user_friendships, class_name: 'UserFriendship',
                                      foreign_key: :user_id,
                                      conditions: { state: 'requested' }
  has_many :requested_friends, through: :pending_user_friendships, source: :friend
  
  def full_name
    first_name + " " + last_name
  end
  
  def to_param
    profile_name
  end
  
  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)
    
    "http://gravatar.com/avatar/#{hash}"
  end
end

