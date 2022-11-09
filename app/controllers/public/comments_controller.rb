class Public::CommentsController < ApplicationController

  before_action :current_customer_check,only: [:update, :destroy]

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to  public_post_path(comment.post.id)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.customer_id = current_customer.id
    if @comment.save
      redirect_to request.referer
    else
      @post_new = Post.new
      @comments = @post.comments
      redirect_to public_post_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment =Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def current_customer_check
    unless current_customer.id == Comment.find(params[:id]).customer_id
    redirect_to new_customer_session_path
    end
  end
end
