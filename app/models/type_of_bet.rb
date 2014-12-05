class TypeOfBet < ActiveRecord::Base
  attr_accessible :name

  has_many :predictions

end
