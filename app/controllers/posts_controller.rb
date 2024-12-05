class PostsController < ApplicationController
  ITEMS_PER_PAGE = 5
  def index
    @posts = Post.all
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
    @commentsLength = @post.comments.count # Total number of posts
    @commentPage = params.fetch(:commentPage, 0).to_i
    @commentPage = 0 if @commentPage < 0
    @commentPage = [ @commentPage, (@commentsLength / ITEMS_PER_PAGE).floor ].min
    @comments = @post.comments
                 .order(created_at: :desc)
                 .offset(@commentPage * ITEMS_PER_PAGE)
                 .limit(ITEMS_PER_PAGE)
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
