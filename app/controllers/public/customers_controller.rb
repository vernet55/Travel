class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  before_action :current_customer,only: [:edit,:XXX]

  def show
    #@customer = current_customer

    @customer = Customer.find(params[:id])
    @posts = Post.where(customer_id: @customer.id)
    #@posts = @customer.posts.page(params[:page]).reverse_order

    @following_customers = @customer.following_customer

    @follower_customers = @customer.follower_customer
  end

  def follows
    customer = Customer.find(params[:customer_id])
    @customers = customer.following_customer.page(params[:page]).per(3).reverse_order
  end

  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.follower_customer.page(params[:page]).per(3).reverse_order
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer != current_customer

      redirect_to public_path(current_customer.id)
    end
    @post = Post.find_by(id: params[:id])
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to public_path(current_customer)
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :username, :sex, :comment, :profile_image)
  end
end
