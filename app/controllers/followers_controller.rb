class FollowersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_user, only: [:index]
  before_action :set_ranks, only: [:index]

  # GET /followers
  # GET /followers.json
  def index
    @followers = @user.followers.page(params[:page])
    @relationship = Relationship.find_by(user_id: current_user.id, follow_id: @user)
  end


  private
    def set_user
      @user = User.find(params[:user_id])
    end

    # Get the 3 most-liked public posts in order
    def set_ranks
      @rank_posts = Post.status_public.joins(:likes).group(:post_id).order('count(likes.post_id) desc').limit(3)
    end

end
