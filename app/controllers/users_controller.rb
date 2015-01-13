class UsersController < ApplicationController
  respond_to :html, :json

  skip_before_filter :verify_authenticity_token
  def new
  end
  
  def index
    @tipster = User.where(role: "Tipster")
    @customer = User.where(role: "Customer")
    @users = User.all.to_json
    calc_win_percentage
    respond_with(@users)
  end

  # Method to work out the win percentage of a user which be used on the output page
  def calc_win_percentage
    users = User.all
    users.map do |user|
      tips = user.tips.count.to_f
      tips_won = user.tips.where({:won => true}).count.to_f 
      if tips > 0
        win_percentag = (tips_won/tips)*100
        user[:win_percentage] = win_percentag
      else
        user[:win_percentage] = 0
      end
      user.save
    end
    @users.save
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
    @tipster = User.where(role: "Tipster")
    @top_3 = @tipster.order('win_percentage DESC').limit(3)
    render json: { data: @top_3 }.to_json
  end

  # Method to get the tips of the people you follow
  def followed_tipsters
    @followedTipsters = current_user.reverse_user_connections.map do |connection|
      follow = Hash.new
      follow[:id] = connection.tipster_id
      follow[:name] = connection.tipster_name
      follow
    end
    render json: { data: @followedTipsters }.to_json
  end

  # Method to get all of the tipsters on the website so this can be used for the leadertable board
  def tipsters
    nully
    @tipsters = User.where(role: "Tipster").to_json(:include => :user_connections)# the include is needed for the following button
    render json: { data: @tipsters }
  end

  def nully
    @connections = UserConnection.all
    @connections.map do |connection|

      if current_user.id != connection.customer_id && connection.following != true
        connection.following = nil
      elsif current_user.id == connection.customer_id && connection.following != true
        connection.following = false
      end
      connection.save
    end
  end

  def rotated_tipsters
    @rotatedTipsters = User.where(role: "Tipster").map do |tipster|
      tipster.user_connections.rotate(-1)
    end
  end

  # Method find a user for the their profile page
  def users_profile
    follow_count
    @usersProfile = User.find(params[:id]).to_json(:include => :user_connections)
    render json: { data: @usersProfile }
  end

  def follow_count
    user = User.find(params[:id])  
    user.user_connections.each do |connection| 
      @follow_count = 0
      if connection.following == true 
        @follow_count += 1
      end
    end
    user[:follow_count] = @follow_count
    user.save
  end

  def profile_tips 
    @userTips = Tip.where(user_id: params[:tip][:user_id]).to_json(:include => [:predictions => {:include => {:type_of_bet => {:only => :name}}}, :predictions =>{:include => {:result =>{:only => :betWon}}}])
    render json: { data: @userTips }.to_json
  end

  def profile_predictions
    @userPredictions = Prediction.find(params[:predictions][:tip_id])
    render json: { data: @userPredictions }.to_json
  end
end