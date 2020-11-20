class HomeController < ApplicationController
  def top
    if user_signed_in?
      respond_to do |format|
        format.html { redirect_to posts_path }
      end
    end

    @posts = Post.status_public.limit(3).order(created_at: :desc)
  end
end
