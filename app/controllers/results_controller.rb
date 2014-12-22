class ResultsController < ApplicationController
  before_filter :set_result, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @results = Result.all
    respond_with(@results)
  end

  def show
    respond_with(@result)
  end

  def new
    @result = Result.new
    respond_with(@result)
  end

  def edit
  end

  def create
    @result = Result.new(params[:result])
    @result.save
    respond_with(@result)
  end

  def update
    @result.update_attributes(params[:result])
    respond_with(@result)
  end

  def destroy
    @result.destroy
    respond_with(@result)
  end

  def bet_won
    self.betWon = true
  end

  def bet_lost
    self.betWon = false
  end

  def set_variables_for_result
    predictionHomeTeam = Prediction.predictionGoalsHomeTeam
    predictionAwayTeam = Prediction.predictionGoalsAwayTeam
    resultHomeTeam = self.goalsHomeTeam 
    resultAwayTeam = self.goalsAwayTeam
    predictionTotalNumberOfGoals = (predictionHomeTeam + predictionAwayTeam)
    resultTotalNumberOfGoals = (resultHomeTeam + resultAwayTeam)
    @correctScore = predictionHomeTeam == resultHomeTeam && predictionAwayTeam == resultAwayTeam
    @winHomeTeam = resultHomeTeam > resultAwayTeam && predictionHomeTeam > predictionAwayTeam
    @winAwayTeam = resultAwayTeam > resultHomeTeam && predictionAwayTeam > predictionHomeTeam
    @draw = predictionHomeTeam == predictionAwayTeam && resultHomeTeam == resultAwayTeam
    @bothTeamsToScore = (predictionHomeTeam > 0 && predictionAwayTeam > 0) && (resultHomeTeam > 0 && resultAwayTeam > 0)
    @over0_5 = (predictionTotalNumberOfGoals > 0.5) && (resultTotalNumberOfGoals > 0.5)
    @over1_5 = (predictionTotalNumberOfGoals > 1.5) && (resultTotalNumberOfGoals > 1.5)
    @over2_5 = (predictionTotalNumberOfGoals > 2.5) && (resultTotalNumberOfGoals > 2.5)
    @over3_5 = (predictionTotalNumberOfGoals > 3.5) && (resultTotalNumberOfGoals > 3.5)
    @over4_5 = (predictionTotalNumberOfGoals > 4.5) && (resultTotalNumberOfGoals > 4.5)
    @over5_5 = (predictionTotalNumberOfGoals > 5.5) && (resultTotalNumberOfGoals > 5.5)
    @over6_5 = (predictionTotalNumberOfGoals > 6.5) && (resultTotalNumberOfGoals > 6.5)
    @over7_5 = (predictionTotalNumberOfGoals > 7.5) && (resultTotalNumberOfGoals > 7.5)
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

  private
    def set_result
      @result = Result.find(params[:id])
    end
end
