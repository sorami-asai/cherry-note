class UsersController < ApplicationController

  before_action :set_users

  def show
    @tweets = @users.tweets
    @tweets = @tweets.order("created_at DESC").page(params[:page]).per(10)
    @comments = @users.comments.includes(:tweet)
    if user_signed_in?
      @like_hash = Like.where(user_id: current_user.id).pluck(:id, :tweet_id).to_h
    end
  end

  def edit
  end

  def update
    if @users.update(users_params)
      redirect_to user_path(@users)
    else
      render 'edit'
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private

  def users_params
    params.require(:user).permit(:nickname, :email, :image)
  end

  def set_users
    @users = User.find(params[:id])
  end
end
