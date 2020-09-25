class PurchaseController < ApplicationController
  require 'payjp'

  def index
    card = Creditcard.where(user_id: current_user.id).last
    if card.blank?
      # redirect_to controller: "creditcards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    @product = Product.find(params[:format])
  end

  def pay
    card = Creditcard.where(user_id: current_user.id).last
    @product = Product.find(params[:format])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @product.price, 
    :customer => card.customer_id, 
    :currency => 'jpy'
  )
  redirect_to action: 'done' 
  end

end
