class TipsController < ApplicationController
  before_filter :set_tip, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  skip_before_filter :verify_authenticity_token

  def index
    @tips = Tip.all.to_json(:include => :predictions)
    respond_with(@tips)
  end

  def show
    respond_with(@tip)
  end

  def new
    @tip = Tip.new
    respond_with(@tip)
  end
  
  def edit
  end

  def create
    @tip = Tip.new(params[:tip])
    @tip.save
    params[:prediction].each do |p|
      @prediction = Prediction.find(p[:fixtureId])
      # @prediction.predictionGoalsHomeTeam = p[:predictionGoalsHomeTeam]
      # @prediction.predictionGoalsAwayTeam = p[:predictionGoalsAwayTeam]
      @prediction.type_of_bet_id = p[:typeOfBet].to_i
      @tip.predictions << @prediction
    end
    respond_with(@tip)
  end

  def update
    @tip.update_attributes(params[:tip])
    respond_with(@tip)
  end

  # Method to see whether all of the predictions on a tip are won or not and if they are, this will set the tip to won
  def tip_won
    @tip = Tip.find(params[:tip][:tip_id])
    @prediction = []
    @tip.predictions.each do |prediction|
      @prediction.push(prediction.result.betWon)
    end 
    if @prediction.all?
      @tip.won = true
    else
      @tip.won = false
    end
    @tip.save
    render json: { data: @tip }.to_json
  end

  def destroy
    @tip.destroy
    respond_with(@tip)
  end

  private
    def set_tip
      @tip = Tip.find(params[:id])
    end
end
