class Public::CommentsController < ApplicationController

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

    def destroy
      @post = Post.find(params[:post_id])
      @Comment =Comment.find(params[:id])
      @comment.destroy
      redirect_to request.referer
    end
  
    def comment_params
      params.require(:comment).permit(:comment)
    end
    
  end
end
