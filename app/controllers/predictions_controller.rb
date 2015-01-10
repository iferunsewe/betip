class PredictionsController < ApplicationController
  before_filter  only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  skip_before_filter :verify_authenticity_token

  def index
    @predictions = Prediction.all
    respond_with(@predictions)
  end

  # Method to show all of fixtures today which can be used on the homepage
  def fixtures_today
    @fixturesToday = Prediction.where('date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
    render json: { data: @fixturesToday }.to_json
  end

  # Method to show all of fixtures this week which can be used on the homepage and make a tip page
  def fixtures_this_week 
    @fixturesThisWeek = Prediction.where('date BETWEEN ? AND ?', DateTime.now.beginning_of_week, DateTime.now.end_of_week).all
    render json: { data: @fixturesThisWeek }.to_json
  end

  # Method to select all of correct predictions, which may used to work out the win ratio for a user
  def correct_prediction
    @predictions = Prediction.all
    @correctPredictions = @predictions.select do |prediction|
      prediction.result.betWon == true
    end
  end

  def show
    respond_with(@prediction)
  end

  def new
    @prediction = Prediction.new
    respond_with(@prediction)
  end

  def edit
  end

  def create
    @prediction = Prediction.new(params[:prediction])
    @prediction.save
    respond_with(@prediction)
  end

  def update
    @prediction = Prediction.find(params[:id])
    @prediction.update_attributes(params[:prediction])
    respond_with(@prediction)
  end

  # Method to check the result of the prediction made
  def result_bet
    @prediction = Prediction.find(params[:prediction][:prediction_id])
    if @prediction.result.goalsHomeTeam != nil
    resultHomeTeam = @prediction.result.goalsHomeTeam 
    resultAwayTeam = @prediction.result.goalsAwayTeam
    resultTotalNumberOfGoals = (resultHomeTeam + resultAwayTeam)
    typeOfBetId = @prediction.type_of_bet_id
    @winHomeTeam = typeOfBetId == 1 && (resultHomeTeam > resultAwayTeam)
    @winAwayTeam = typeOfBetId == 2 && (resultAwayTeam > resultHomeTeam)
    @draw = typeOfBetId == 3 && (resultAwayTeam == resultHomeTeam)
    @bothTeamsToScore = typeOfBetId == 4 && (resultHomeTeam > 0 && resultAwayTeam > 0)
    @over0_5 = typeOfBetId == 5 && (resultTotalNumberOfGoals > 0.5)
    @over1_5 = typeOfBetId == 6 && (resultTotalNumberOfGoals > 1.5)
    @over2_5 = typeOfBetId == 7 && (resultTotalNumberOfGoals > 2.5)
    @over3_5 = typeOfBetId == 8 && (resultTotalNumberOfGoals > 3.5)
    @over4_5 = typeOfBetId == 9 && (resultTotalNumberOfGoals > 4.5)
    @over5_5 = typeOfBetId == 10 && (resultTotalNumberOfGoals > 5.5)
    @over6_5 = typeOfBetId == 11 && (resultTotalNumberOfGoals > 6.5)
    @over7_5 = typeOfBetId == 12 && (resultTotalNumberOfGoals > 7.5)
    have_they_won?
    end

    render json: { data:  @prediction }.to_json
  end

  # Method to set whether the prediction is won or not
  def have_they_won?
    if @winHomeTeam
      @prediction.result.betWon = true
    elsif @winAwayTeam
      @prediction.result.betWon = true
    elsif  @draw
      @prediction.result.betWon = true
    elsif @bothTeamsToScore
      @prediction.result.betWon = true
    elsif @over0_5
      @prediction.result.betWon = true
    elsif @over1_5
      @prediction.result.betWon = true
    elsif @over2_5
      @prediction.result.betWon = true
    elsif @over3_5
      @prediction.result.betWon = true
    elsif @over4_5
      @prediction.result.betWon = true
    elsif @over5_5
      @prediction.result.betWon = true
    elsif @over6_5
      @prediction.result.betWon = true
    elsif @over7_5
      @prediction.result.betWon = true
    else
      @prediction.result.betWon = false
    end
    @prediction.save
  end

  def destroy
    @prediction.destroy
    respond_with(@prediction)
  end
  
  private
    def set_prediction
      @prediction = Prediction.find(params[:id])
    end

end
