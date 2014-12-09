class UsersController < ApplicationController
  respond_to :html, :json
  def new
  end
  
  def index
    # @tipster = User.where(role: "Tipster")
    # @customer = User.where(role: "Customer")
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

  def top_three
    @top_3 = User.order('win_percentage DESC').limit(3)
    render json: { data: @top_3 }.to_json
  end
end