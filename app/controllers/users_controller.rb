class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def show
    @posts = Post.where(user_id: @user).status_public.order(created_at: :desc).page(params[:page])

    if user_signed_in?
      @relationship = Relationship.find_by(user_id: current_user.id, follow_id: @user)
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
