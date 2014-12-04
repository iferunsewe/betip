class Result < ActiveRecord::Base
  attr_accessible :betWon, :goalsAwayTeam, :goalsHomeTeam

  belongs_to :prediction

  def bet_won
    self.betWon = true
  end

  def bet_lost
    self.betWon = false
  end

  def result_bet()
    if bet_won
      self.goalsHomeTeam == Prediction.predictionGoalsHomeTeam
      self.goalsAwayTeam == Prediction.predictionGoalsAwayTeam   
    else
      bet_lost
    end
  end

end