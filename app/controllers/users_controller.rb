class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      flash[:success] = "You have successfully registered"
      redirect_to tweets_path
    else 
      flash[:danger] = "Something is wrong. Try again"
      redirect_to new_user_path
    end
  end
  
  private
    
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end