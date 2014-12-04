class Prediction < ActiveRecord::Base
  attr_accessible :awayTeam, :date, :homeTeam, :predictionGoalsAwayTeam, :predictionGoalsHomeTeam, :tip_ids, :result_id, :type_of_bet_id

  has_and_belongs_to_many :tips
  has_and_belongs_to_many :type_of_bets
  has_one :result
  belongs_to :user

  def predict_bet
    @winHomeTeam = self.predictionGoalsHomeTeam > self.predictionGoalsAwayTeam
    @winAwayTeam = self.predictionGoalsAwayTeam > self.predictionGoalsHomeTeam
    @draw = self.predictionGoalsHomeTeam == self.predictionGoalsAwayTeam
    @btts = (self.predictionGoalsHomeTeam > 0) && (self.predictionAwayHomeTeam > 0)
    @over0_5 = (self.predictionGoalsHomeTeam + self.predictionGoalsAwayTeam) > 0.5
    @over1_5 = (self.predictionGoalsHomeTeam + self.predictionGoalsAwayTeam) > 1.5
    @over2_5 = (self.predictionGoalsHomeTeam + self.predictionGoalsAwayTeam) > 2.5
    @over3_5 = (self.predictionGoalsHomeTeam + self.predictionGoalsAwayTeam) > 3.5
    @over4_5 = (self.predictionGoalsHomeTeam + self.predictionGoalsAwayTeam) > 4.5
    @over5_5 = (self.predictionGoalsHomeTeam + self.predictionGoalsAwayTeam) > 5.5
    @over6_5 = (self.predictionGoalsHomeTeam + self.predictionGoalsAwayTeam) > 6.5
    @over7_5 = (self.predictionGoalsHomeTeam + self.predictionGoalsAwayTeam) > 7.5
    @correctScore = self.predictionGoalsHomeTeam && self.predictionGoalsAwayTeam
  end

  def fixtures_today

  end
end
