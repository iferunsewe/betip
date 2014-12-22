class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :user_image, :prediction_id, :price, :provider, :role, :tip_id, :uid, :win_percentage, :user_connections

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

  # def tip_predictions(user)
  #   user.tips.each do |tip|
  #     puts tip.predictions
  #   end
  # end

  
end
