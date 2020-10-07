class UsersController < ApplicationController
  def show
  end

  def sell_products
    @products = Product.where(seller_id: current_user.id).order("created_at DESC").page(params[:page]).per(6)
  end

  def buy_products
    @products = Product.where(buyer_id: current_user.id).order("created_at DESC").page(params[:page]).per(6)
  end

  def show_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def show_address
    @addresses = Address.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(1)
  end

  def show_userdata
    @user = User.find(current_user.id)
  end
end
