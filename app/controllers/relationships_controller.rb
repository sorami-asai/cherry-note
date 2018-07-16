class RelationshipsController < ApplicationController

  def create
    @users = User.find(params[:followed_id])
    current_user.follow(@users)
    respond_to do |format|
      format.html { redirect_to @users }
      format.js
    end
  end

  def destroy
    @users = Relationship.find(params[:id]).followed
    current_user.unfollow(@users)
    respond_to do |format|
      format.html { redirect_to @users }
      format.js
    end
  end
end
