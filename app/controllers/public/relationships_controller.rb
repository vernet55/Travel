class Public::RelationshipsController < ApplicationController

  def create  # フォローするとき
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  def destroy # フォロー外すとき
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end
end
