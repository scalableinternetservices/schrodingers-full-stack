class CommentsController < ApplicationController
  def create
    if params[:post_id]
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      @comment.save
      redirect_to post_path(@post)
    elsif params[:event_id]
      @event = Event.find(params[:event_id])
      @comment = @event.comments.create(comment_params)
      @comment.save
      redirect_to event_path(@event)
    end
  end

  def new
    @comment = Comment.new
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id, :event_id)
    end
end
