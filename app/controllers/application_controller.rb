class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  def logged_in?
    current_user != nil
  end
end
