class UserConnection < ActiveRecord::Base
  attr_accessible :tipster_id, :customer_id, :following

  belongs_to :tipster, :class_name => :User
  belongs_to :customer, :class_name => :User
end
