class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]
  before_action :set_ranks, only: [:index]
  before_action :authenticate_current_user, only: [:index]

  def index
    @posts = Post.status_public.joins(:likes).where('likes.user_id', @user.id).order('likes.created_at desc').page(params[:page])

    @relationship = Relationship.find_by(user_id: current_user.id, follow_id: @user)
  end

  def create
    @like = Like.create(post_id: params[:post_id], user_id: current_user.id)

    @post = Post.find(params[:post_id])
    @post.create_notification_like!(current_user)

  end

  def destroy
    @post = Post.find(params[:post_id])

    @like = Like.find(params[:id])
    @like.destroy

  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    # Get the 3 most-liked public posts in order
    def set_ranks
      @rank_posts = Post.status_public.joins(:likes).group(:post_id).order('count(likes.post_id) desc').limit(3)
    end

    def authenticate_current_user
      unless current_user == @user
        respond_to do |format|
          format.html { redirect_to current_user, notice: '他のユーザーのいいねした記事の一覧ページにはアクセスできません' }
        end
      end
    end
end
