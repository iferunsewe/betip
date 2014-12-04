class PredictionsController < ApplicationController
  before_filter :set_prediction, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @predictions = Prediction.all
    respond_with(@predictions)
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
