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
  
  # def result_bet(prediction)
  #   case prediction 
  #   when @correctScore
  #     bet_won
  #   when @winHomeTeam
  #     bet_won
  #   when @winAwayTeam
  #     bet_won
  #   when @draw
  #     bet_won
  #   when @bothTeamsToScore
  #     bet_won
  #   when @over0_5
  #     bet_won
  #   when @over1_5
  #     bet_won
  #   when @over2_5
  #     bet_won
  #   when @over3_5
  #     bet_won
  #   when @over4_5
  #     bet_won
  #   when @over5_5 
  #     bet_won
  #   when @over6_5
  #     bet_won
  #   when @over7_5
  #     bet_won
  #   else
  #     bet_lost
  #   end
  # end

  private
    def set_result
      @result = Result.find(params[:id])
    end
end
