class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_ranks, only: [:show, :index, :ranking, :search]

  # GET /posts
  # GET /posts.json
  def index
    user_ids = Relationship.where(user_id: current_user.id).pluck(:follow_id)
    user_ids.push(current_user.id)
    @posts = Post.where(user_id: user_ids).status_public.order(created_at: :desc).page(params[:page])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if @post.status_private? && @post.user != current_user
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'このページにはアクセスできません' }
      end
    end

    @comment_new = Comment.new
    @comments = @post.comments
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.post_cats.build

  end

  # GET /posts/1/edit
  def edit
    unless @post.user == current_user
      respond_to do |format|
        format.html { redirect_to posts_path, notice: '他のユーザーの記事編集ページにはアクセスできません' }
      end
    end

    @post.image.cache! unless @post.image.blank?
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '新規投稿を行いました。' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '投稿を更新しました。' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '投稿を削除しました。' }
      format.json { head :no_content }
    end
  end

  def ranking
    user_ids = Relationship.where(user_id: current_user.id).pluck(:follow_id)
    user_ids.push(current_user.id)
    @posts = Post.status_public.joins(:likes).group(:post_id).order('count(likes.post_id) desc').limit(10)
  end

  def search
    user_ids = Relationship.where(user_id: current_user.id).pluck(:follow_id)
    user_ids.push(current_user.id)
    @posts = Post.where(user_id: user_ids).status_public.order(created_at: :desc).page(params[:page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(
        :title,
        :content,
        :image,
        :status,
        {:cat_ids => []}
      )
    end

    # Get the 3 most-liked public posts in order
    def set_ranks
      @rank_posts = Post.status_public.joins(:likes).group(:post_id).order('count(likes.post_id) desc').limit(3)
    end

end
