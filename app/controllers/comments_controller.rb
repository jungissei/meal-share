class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment_params, only: :create
  before_action :correct_user, only: :destroy

  before_action :set_ranks, only: [:create]

  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @post.create_notification_comment!(current_user, @comment.id)

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def set_ranks
      @rank_posts = Post.status_public.joins(:likes).group(:post_id).order('count(likes.post_id) desc').limit(3)
    end
end
