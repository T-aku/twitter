class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(content: params[:tweet][:content])
    if @tweet.save
      flash[:success] = "Your twwet is successfully submited"
      redirect_to tweets_path
    else
      flash[:danger] = "Something is wrong with your tweet"
      render new_tweet_path
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.content = params[:tweet][:content]
    if @tweet.save
      redirect_to tweets_path
    else
      flash[:danger] = "Something is wrong"
      redirect_to edit_tweet_path
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:success] = "You have successfully destroy your tweet"
    redirect_to tweets_path
  end
  
  
  
end