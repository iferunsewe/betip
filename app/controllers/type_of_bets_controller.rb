class TypeOfBetsController < ApplicationController
  before_filter :set_type_of_bet, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @type_of_bets = TypeOfBet.all
    respond_with(@type_of_bets)
  end

  def show
    respond_with(@type_of_bet)
  end

  def new
    @type_of_bet = TypeOfBet.new
    respond_with(@type_of_bet)
  end

  def edit
  end

  def create
    @type_of_bet = TypeOfBet.new(params[:type_of_bet])
    @type_of_bet.save
    respond_with(@type_of_bet)
  end

  def update
    @type_of_bet.update_attributes(params[:type_of_bet])
    respond_with(@type_of_bet)
  end

  def destroy
    @type_of_bet.destroy
    respond_with(@type_of_bet)
  end

  private
    def set_type_of_bet
      @type_of_bet = TypeOfBet.find(params[:id])
    end
end
