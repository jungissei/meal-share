class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]
  before_action :set_ranks, only: [:show]

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

    # Get the 3 most-liked public posts in order
    def set_ranks
      @rank_posts = Post.status_public.joins(:likes).group(:post_id).order('count(likes.post_id) desc').limit(3)
    end
end
