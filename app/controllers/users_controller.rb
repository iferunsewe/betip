class UsersController < ApplicationController
  def index
    @users = User.all
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
end