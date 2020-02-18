class SessionsController < ApplicationController
  
  def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:id] =  user.id
      flash[:success] = "You have successfully logged in"
      redirect_to tweets_path
    else
      flash[:danger] = "Something is wrong with your email or password"
      render new_session_path
    end
  end
  
  def destroy
    session[:id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end
  
end