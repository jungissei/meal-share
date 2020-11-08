class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment_params, only: :create
  before_action :correct_user, only: :destroy

  before_action :set_ranks, only: [:create]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    @post = @comment.post

    if @comment.save
      @post.create_notification_comment!(current_user, @comment.id)
    else
      @like = Like.find_by(post_id: @post.id, user_id: current_user.id)
      @comments = @post.comments
      render template: 'posts/show'
    end
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
      @rank_posts = Like.create_all_ranks
    end
end
