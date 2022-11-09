class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @comment = @post.comments.new
    @comments = Comment.all.where(post_id: @post.id)
    p @comments
    @likes_count = Like.where(post_id: @post.id).count
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to public_post_path(post.id)
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @customer =current_customer


    if @post.save
      redirect_to public_post_path(@post.id), notice: 'You have created post successfully.'
    else
      @posts = Post.all
    end
  end

  def searcd
    @section_title = "「#{params[:search]}」の検索結果"
    @posts = if params[:search].present?
                Post.where(['shop_name LIKE ? OR nearest LIKE ?',
                        "%#{params[:search]}%", "%#{params[:search]}%"])
                 .paginate(page: params[:page], per_page: 12).recent
             else
                Post.none
             end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to public_path(current_customer)
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, :image, :lat, :lng)
  end
end
