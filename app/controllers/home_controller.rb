class HomeController < ApplicationController
  def top
    @posts = Post.limit(3).order(:created_at)
    @cats = Cat.where(user_id: current_user.id)
  end
end
