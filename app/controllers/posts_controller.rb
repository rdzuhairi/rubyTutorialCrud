class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "You Created the post!"
    else
      render :new, alert: "You post wasn't created"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
