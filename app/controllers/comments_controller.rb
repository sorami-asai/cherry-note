class CommentsController < ApplicationController

  before_action :set_comments, only: [:edit, :update, :destroy]

  before_action :set_tweets

  def new
    @comments = Comment.new
  end

  def create
    @comments = Comment.new(comments_params)
    if @comments.save
      redirect_to tweet_path(@tweets)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comments.update(comments_params)
      redirect_to tweet_path(@tweets)
    else
      render 'edit'
    end
  end

  def destroy
    @comments.destroy
    redirect_to tweet_path(@tweets)
  end

  private

  def comments_params
    params.require(:comment).permit(:comment, :comments).merge(tweet_id: params[:tweet_id], user_id: current_user.id)
  end

  def set_comments
    @comments = Comment.find(params[:id])
  end

  def set_tweets
    @tweets = Tweet.find(params[:tweet_id])
  end

  def set_users
    @users = User.find(params[:user_id])
  end
end

