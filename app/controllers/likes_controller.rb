class LikesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @like = Like.create(user_id: current_user.id, tweet_id: @tweet.id)
    @like_hash ={}

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    like = Like.find_by(user_id: current_user.id, tweet_id: @tweet.id)
    like.destroy
    @like_hash = {}

    respond_to do |format|
      format.html
      format.js
    end
  end
end
