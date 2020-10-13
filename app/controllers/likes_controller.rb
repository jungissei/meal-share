class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.create(post_id: params[:post_id], user_id: current_user.id)

    post = Post.find(params[:post_id])
    post.create_notification_like!(current_user)
    redirect_to post
  end

  def destroy
    post = Post.find(params[:post_id])

    @like = Like.find(params[:id])
    @like.destroy

    redirect_to post
  end
end
