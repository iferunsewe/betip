class TypeOfBet < ActiveRecord::Base
  attr_accessible :name, :prediction_ids

  has_many :predictions

end
