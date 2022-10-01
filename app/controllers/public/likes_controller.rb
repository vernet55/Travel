class Public::LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = current_customer.likes.new(post_id: @post.id)
    @like.save
    @like_count = Like.where(post_id: @post.id).count
    redirect_to public_post_path(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_customer.likes.find_by(post_id: @post.id)
    @like.destroy
    @like_count = Like.where(post_id: @post.id).count
    redirect_to public_post_path(params[:post_id])
  end
end
