class Admin::CustomersController < ApplicationController

  def index
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])

    @posts = @customer.posts
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_show_customer_path(customer.id)
  end

  def destroy
    customer = Customer.find(params[:id])
    post = Post.find(params[:post_id])  # データ（レコード）を1件取得
    post.destroy  # データ（レコード）を削除
    redirect_to admin_show_customer_path(customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :encrypted_password, :postal_code, :comment, :sex, :telephone_number, :is_deleted)
  end
end
