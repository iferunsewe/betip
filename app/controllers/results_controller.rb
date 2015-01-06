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

  private
    def set_result
      @result = Result.find(params[:id])
    end
end
