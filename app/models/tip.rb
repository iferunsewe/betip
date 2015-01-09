class Tip < ActiveRecord::Base
  attr_accessible :bookies, :odds, :prediction_ids, :stake, :type, :won, :user_id, :comment


  has_and_belongs_to_many :predictions
  has_many :results, through: :predictions
  belongs_to :user

  accepts_nested_attributes_for :predictions
  accepts_nested_attributes_for :results
end
