class TypeOfBet < ActiveRecord::Base
  attr_accessible :name, :prediction_ids

  has_and_belongs_to_many :predictions
end
