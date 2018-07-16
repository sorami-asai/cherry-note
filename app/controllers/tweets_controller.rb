class TweetsController < ApplicationController

  before_action :set_tweets, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @comments = @tweets.comments.includes(:user)
    @comments = @comments.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @tweets = Tweet.new
  end

  def create
    @tweets = Tweet.new(tweets_params)
    if @tweets.save
      redirect_to tweets_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @tweets.update(tweets_params)
      redirect_to tweets_path
    else
      render 'edit'
    end
  end

  def destroy
    @tweets.destroy
    redirect_to tweets_path
  end

  private

  def tweets_params
    params.require(:tweet).permit(:title, :text).merge(user_id: current_user.id)
  end

  def set_tweets
    @tweets = Tweet.find(params[:id])
  end
end
