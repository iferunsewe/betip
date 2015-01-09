class Prediction < ActiveRecord::Base
  attr_accessible :fixture_id, :awayTeam, :date, :homeTeam, :predictionGoalsAwayTeam, :predictionGoalsHomeTeam, :tip_ids, :type_of_bet_id, :user_id
  
  has_and_belongs_to_many :tips
  has_one :result
  belongs_to :type_of_bet
  belongs_to :user

  accepts_nested_attributes_for :result
end