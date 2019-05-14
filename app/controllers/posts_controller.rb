class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "You Created the post!"
    else
      render :new, alert: "You post wasn't created"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully update"
    else
      render :edit, alert: "your post wasn't updated"
    end
  end

  def destroy
      @post.destroy

      redirect_to posts_path, notice: "Your post was deleted"
  end

  def set_post
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
