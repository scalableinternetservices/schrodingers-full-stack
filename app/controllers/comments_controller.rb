class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.save
    redirect_to post_path(@post)
  end

  def new
    @comment = Comment.new
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id)
    end
end
