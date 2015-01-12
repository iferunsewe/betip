class UserConnectionsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  respond_to :html, :json

  def index
    @connections = UserConnection.all
    respond_with(@connections)
  end

  def show
    @connection = UserConnection.find(params[:id])
    @connection.save
    respond_with(@connection)
  end

  def create
    @connections = UserConnection.new
    params1 = params[:user_connection]
    @connections.tipster_id = params1[:tipster_id]
    @connections.customer_id = params1[:customer_id]
    @connections.following = params1[:following]
    @connections.customer_name = params1[:customer_name]
    @connections.tipster_name = params1[:tipster_name]
    @connections.save
    respond_with(@connections)
  end

  # Method to send a subscripstion request
  def subscription_requests
    @subscriptionRequests = UserConnection.where(tipster_id: current_user.id)
    render json: { data: @subscriptionRequests }.to_json
  end

  # Method to see find the users which have been followed so it change their status to pending
  def followed_tipster
    @followed_tipster = UserConnection.where(customer_id: params[:tipster][:customer_id])
    render json: { data: @followed_tipster }.to_json
  end

  def update
    @connection = UserConnection.find(params[:id])
    params1 = params[:connection]
    @connection.following = params1[:following]
    @connection.save
    respond_with(@connection)
  end

  def destroy
    @connection = UserConnection.find(params[:id])
    @connection.destroy
    respond_with(@connection)
  end
end