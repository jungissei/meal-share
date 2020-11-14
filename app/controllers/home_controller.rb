class HomeController < ApplicationController
  def top
    @posts = Post.status_public.limit(3).order(created_at: :desc)
  end
end
