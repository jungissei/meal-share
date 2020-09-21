class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def show
    @posts = Post.where(user_id:params[:id]).order(created_at: :desc).page(params[:page])
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
