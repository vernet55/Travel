class Public::PostsController < ApplicationController
  def new
  end

  def index
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments

    @likes_count = Like.where(post_id: @post.id).count
  end

  def edit
  end

  def update
  end

  def create
    @post = Post.new(post_params)
    #byebug
    @post.customer_id = current_customer.id
    @customer =current_customer
    #byebug

    if @post.save
      redirect_to public_posts_path(@post.id), notice: 'You have created post successfully.'
    else
      @posts = Post.all
    end
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
