class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    if session[:current_user_id] != @post.username
      @show = false
    else
      @show = true
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    if session[:current_user_id] != @post.username
      @show = false
    else
      @show = true
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if session[:current_user_id] == @post.username
      @post.destroy
      redirect_to root_path, status: :see_other
    end

  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :username)
    end

end
