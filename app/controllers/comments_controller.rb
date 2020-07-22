class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment_params, only: :create
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    @post = @comment.post

    if @comment.save
      flash[:success] = 'コメントしました'
      @post.create_notification_comment!(current_user, @comment.id)
      redirect_back(fallback_location: root_path)
    else
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      render template: 'posts/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'コメントを削除しました'
    redirect_to @comment.post
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
