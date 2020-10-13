class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card
  before_action :set_product

  def index
    if @product.seller_id == current_user.id || @product.buyer_id.present?
      redirect_to product_path(@product.id)
    else
      if @card.present?
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
      @address = Address.find(current_user.id)
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => @product.price, 
      :customer => @card.customer_id, 
      :currency => 'jpy'
    )
    @product.buyer_id = current_user.id
    @product.save
    redirect_to done_purchase_index_path(@product.id)
  end

  def set_card
    @card = Creditcard.where(user_id: current_user.id).last
  end

  def set_product
    @product = Product.find(params[:format])
  end

end
