class HomeController < ApplicationController
  def top
    @posts = Post.limit(3).order(created_at: :desc)
  end
end
