class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :user_image, :prediction_id, :price, :role, :tip_id, :win_percentage, :user_connections

  #associations to conduct the following relationship between tipsters and their customers
  has_many(:user_connections, :foreign_key => :tipster_id, :dependent => :destroy)
  has_many(:reverse_user_connections, :class_name => :UserConnection, :foreign_key => :customer_id, :dependent => :destroy)
  has_many :users, :through => :user_connections, :source => :customer

  has_many :tips
  has_many :predictions
  has_many :providers, dependent: :destroy

  accepts_nested_attributes_for :tips

  mount_uploader :user_image, UserImageUploader

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  def self.map_authentication_to_user_properties(authentication)
    authentication.slice(:info, :provider, :uid, :user_id)
  end

  def populate_user_fields(auth, user, kind)
    case kind
    when "Facebook"
      user.name = auth.info.name if !auth.info.name.nil? && user.name.blank?
      user.email = auth.info.email if !auth.info.email.nil? && user.email.blank?
      user.user_image = auth.info.image if user.user_image.blank?
      user.skip_confirmation! if user.respond_to?(:skip_confirmation!) 
    when "Google"
      user.name = auth.info.name if !auth.info.name.nil? &&user.name.blank?
      user.email = auth.info.email if !auth.info.email.nil? && user.email.blank?
      user.user_image = auth.info.image if user.user_image.blank?
      user.skip_confirmation! if user.respond_to?(:skip_confirmation!) 
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.authentication"]
 
        user.name = auth.info.name if user.name.blank?
        user.email = auth.info.email if user.email.blank?
        user.user_image = auth.info.image if user.user_image.blank?
        user.skip_confirmation! if user.respond_to?(:skip_confirmation!) # don't require email confirmation
 
      end
    end
  end

  before_create :default_win_percentage

  private
  def default_win_percentage
    self.win_percentage = 0
  end
end
