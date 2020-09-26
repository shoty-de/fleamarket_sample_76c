class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card

  def index
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    @product = Product.find(params[:format])
    @address = Address.find(current_user.id)
  end

  def pay
    @product = Product.find(params[:format])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => @product.price, 
      :customer => @card.customer_id, 
      :currency => 'jpy'
    )
    @product.buyer_id = current_user.id
    @product.save
    redirect_to action: 'done' 
  end

  def set_card
    @card = Creditcard.where(user_id: current_user.id).last
  end

end
