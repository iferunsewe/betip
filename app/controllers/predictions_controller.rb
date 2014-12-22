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
    binding.pry
    @prediction = Prediction.find(params[:id])
    @prediction.update_attributes(params[:prediction])
    respond_with(@prediction)
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
