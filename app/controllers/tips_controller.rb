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
    @prediction = Prediction.find(params[:prediction][:fixtureId])
    @prediction.predictionGoalsHomeTeam = params[:prediction][:predictionGoalsHomeTeam]
    @prediction.predictionGoalsHomeTeam = params[:prediction][:predictionGoalsAwayTeam]
    @prediction.save

    @tip.predictions << @prediction
    respond_with(@tip)
  end

  def update
    @tip.update_attributes(params[:tip])
    respond_with(@tip)
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
