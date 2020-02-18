class ApplicationController < ActionController::Base
  
  helper_method :logged_in?, :current_user
  
  def logged_in?
    if !session[:id].blank?
      return true
    else
      return false
    end
  end
  
  def current_user
    user = User.find(session[:id])
    return user
  end
  
end
