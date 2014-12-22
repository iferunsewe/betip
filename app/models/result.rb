class Result < ActiveRecord::Base
  attr_accessible :betWon, :goalsAwayTeam, :goalsHomeTeam, :prediction_id

  belongs_to :prediction
end