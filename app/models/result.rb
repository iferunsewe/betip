class Result < ActiveRecord::Base
  attr_accessible :betWon, :goalsAwayTeam, :goalsHomeTeam

  belongs_to :prediction

  def bet_won
    self.betWon = true
  end

  def bet_lost
    self.betWon = false
  end

  def set_variables_for_result
    PredictionHomeTeam = Prediction.predictionGoalsHomeTeam
    PredictionAwayTeam = Prediction.predictionGoalsAwayTeam
    ResultHomeTeam = self.goalsHomeTeam 
    ResultAwayTeam = self.goalsAwayTeam
    PredictionTotalNumberOfGoals = (@PredictionHomeTeam + @PredictionAwayTeam)
    ResultTotalNumberOfGoals = (@ResultHomeTeam + @ResultAwayTeam)
    @correctScore = @PredictionHomeTeam == @ResultHomeTeam && @PredictionAwayTeam == @ResultAwayTeam
    @winHomeTeam = @ResultHomeTeam > @ResultAwayTeam && @PredictionHomeTeam > @PredictionAwayTeam
    @winAwayTeam = @ResultAwayTeam > @ResultHomeTeam && @PredictionAwayTeam > @PredictionHomeTeam
    @draw = @PredictionHomeTeam == @PredictionAwayTeam && @ResultHomeTeam == @ResultAwayTeam
    @bothTeamsToScore = (@PredictionHomeTeam > 0 && @PredictionAwayTeam > 0) && (@ResultHomeTeam > 0 && @ResultAwayTeam > 0)
    @over0_5 = (@PredictionTotalNumberOfGoals > 0.5) && (@ResultTotalNumberOfGoals > 0.5)
    @over1_5 = (@PredictionTotalNumberOfGoals > 1.5) && (@ResultTotalNumberOfGoals > 1.5)
    @over2_5 = (@PredictionTotalNumberOfGoals > 2.5) && (@ResultTotalNumberOfGoals > 2.5)
    @over3_5 = (@PredictionTotalNumberOfGoals > 3.5) && (@ResultTotalNumberOfGoals > 3.5)
    @over4_5 = (@PredictionTotalNumberOfGoals > 4.5) && (@ResultTotalNumberOfGoals > 4.5)
    @over5_5 = (@PredictionTotalNumberOfGoals > 5.5) && (@ResultTotalNumberOfGoals > 5.5)
    @over6_5 = (@PredictionTotalNumberOfGoals > 6.5) && (@ResultTotalNumberOfGoals > 6.5)
    @over7_5 = (@PredictionTotalNumberOfGoals > 7.5) && (@ResultTotalNumberOfGoals > 7.5)
  end

  def result_bet(prediction)
    case prediction 
    when @correctScore
      bet_won
    when @winHomeTeam
      bet_won
    when @winAwayTeam
      bet_won
    when @draw
      bet_won
    when @bothTeamsToScore
      bet_won
    when @over0_5
      bet_won
    when @over1_5
      bet_won
    when @over2_5
      bet_won
    when @over3_5
      bet_won
    when @over4_5
      bet_won
    when @over5_5 
      bet_won
    when @over6_5
      bet_won
    when @over7_5
      bet_won
    else
      bet_lost
    end
  end
end