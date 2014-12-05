class Prediction < ActiveRecord::Base
  attr_accessible :awayTeam, :date, :homeTeam, :predictionGoalsAwayTeam, :predictionGoalsHomeTeam, :tip_ids, :result_id, :type_of_bet_id, :user_id

  has_and_belongs_to_many :tips
  has_one :result
  belongs_to :type_of_bet
  belongs_to :user

  def set_variables_for_prediction
    @PredictionHomeTeam = self.predictionGoalsHomeTeam
    @PredictionAwayTeam = self.predictionGoalsAwayTeam
    @total_number_of_goals = (@PredictionHomeTeam + @PredictionAwayTeam)
    @typeOfBet = TypeOfBet.all
    @correctScore = (@PredictionHomeTeam && @PredictionAwayTeam) && (@typeOfBet.where(name: "Correct Score"))
    @winHomeTeam = (@PredictionHomeTeam > @PredictionAwayTeam) && (@typeOfBet.where(name: "Home Win"))
    @winAwayTeam = (@PredictionAwayTeam > @PredictionHomeTeam) && (@typeOfBet.where(name: "Away Win"))
    @draw = (@PredictionHomeTeam == @PredictionAwayTeam) && (@typeOfBet.where(name: "Draw"))
    @bothTeamsToScore = ((@PredictionHomeTeam > 0) && (@PredictionAwayTeam > 0)) && (@typeOfBet.where(name: "Both teams to score"))
    @over0_5 = (@total_number_of_goals > 0.5) && (@typeOfBet.where(name: "Over 0.5 goals"))
    @over1_5 = (@total_number_of_goals > 1.5) && (@typeOfBet.where(name: "Over 1.5 goals"))
    @over2_5 = (@total_number_of_goals > 2.5) && (@typeOfBet.where(name: "Over 2.5 goals"))
    @over3_5 = (@total_number_of_goals > 3.5) && (@typeOfBet.where(name: "Over 3.5 goals"))
    @over4_5 = (@total_number_of_goals > 4.5) && (@typeOfBet.where(name: "Over 4.5 goals"))
    @over5_5 = (@total_number_of_goals > 5.5) && (@typeOfBet.where(name: "Over 5.5 goals"))
    @over6_5 = (@total_number_of_goals > 6.5) && (@typeOfBet.where(name: "Over 6.5 goals"))
    @over7_5 = (@total_number_of_goals > 7.5) && (@typeOfBet.where(name: "Over 7.5 goals"))
  end

  def fixtures_today
    
  end
end
