class UsersController < ApplicationController
  respond_to :html, :json

  skip_before_filter :verify_authenticity_token
  def new
  end
  
  def index
    @tipster = User.where(role: "Tipster")
    @customer = User.where(role: "Customer")
    @users = User.all.to_json
    respond_with(@users)
  end

  def create
    # run default version defined in Devise::RegistrationsController
    super

    # then add our custom logic
    @user.role = "user"
    @user.save!
  end

  def edit
    # log the ancestors of this controller
    # to confirm that we inherit from ApplicationController
    logger.info self.class.ancestors
    super
  end
  
  def show
    @user = User.find(params[:id])
  end

  # Method to find the top three tipsters on the website to be shown in the carousel on the homepage
  def top_three
    @top_3 = User.order('win_percentage DESC').limit(3)
    render json: { data: @top_3 }.to_json
  end

  # Method to get the tips of the people you follow
  def followed_tips
    @followedTips = current_user.reverse_user_connections.map do |user|
      User.find(user.tipster_id).tips.map do |tip|
        tip.predictions.map do |prediction|
          attrs = prediction.attributes
          attrs[:type_of_bet_name] = prediction.type_of_bet.name
          attrs
        end
      end  
    end.flatten  
    render json: { data: @followedTips }.to_json
  end
  
  # Method to get all of the tipsters on the website so this can be used for the leadertable board
  def tipsters
    @tipsters = User.where(role: "Tipster").to_json(:include => :user_connections)# the include is needed for the following button
    render json: { data: @tipsters }
  end

  # Method find a user for the their profile page
  def users_profile
    @usersProfile = User.find(params[:id])
    render json: { data: @usersProfile }.to_json
  end


  # Get all the tips show on their profile page
  def profile_tips
    @userTips = Tip.where(user_id: params[:tip][:user_id]).to_json(:include => :predictions)
    render json: { data: @userTips }.to_json
  end

  # def profile_predictions
  #   @userPredictions = Prediction.find(params[:predictions][:tip_id])
  #   render json: { data: @userPredictions }.to_json
  # end

  # def profile_type_of_bet
  #   @userTypeOfBet = TypeOfBet.find(params[:type][:type_of_bet_id])
  #   render json: { data: @userTypeOfBet }.to_json
  # end

  # Method to work out the win percentage of a user which be used on the output page
  def win_ratio(user)
    tips = user.tips.count.to_f
    numberOfTipsWon = (Tip.joins(:user).where({:won => true}, {user_id: user.id})).count.to_f
    winRatio = ((numberOfTipsWon / tips) * 100)
  end
end