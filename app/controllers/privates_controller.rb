class PrivatesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_user, only: [:index]
  before_action :authenticate_current_user, only: [:index]

  # GET /privates
  # GET /privates.json
  def index
    @posts = Post.where(user_id: @user).status_private.order(created_at: :desc).page(params[:page])

    @relationship = Relationship.find_by(user_id: current_user.id, follow_id: @user)
  end


  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def authenticate_current_user
      unless current_user == @user
        respond_to do |format|
          format.html { redirect_to current_user, notice: '他のユーザーの非公開記事一覧ページにはアクセスできません' }
        end
      end
    end
end
