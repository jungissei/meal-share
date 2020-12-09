class RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    @relationship = current_user.follow(@user)
    if @relationship.save
      @user.create_notification_follow!(current_user)
    end
  end

  def destroy
    relationship = current_user.unfollow(@user)
    relationship.destroy
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

end
