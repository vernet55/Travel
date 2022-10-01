class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer

    @posts = Post.where(customer_id: current_customer.id)
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer != current_customer

      redirect_to public_customers_my_page_path(current_customer.id)
    end
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to public_customers_my_page_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :username, :sex, :comment, :profile_image)
  end
end
