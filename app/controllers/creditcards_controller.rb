class CreditcardsController < ApplicationController

  require "payjp"

  def new
  end
  
  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: '登録テスト',
        email: current_user.email,
        card: params['payjp-token']
      )
      @card = Creditcard.new(user_id: current_user.id, card_id: customer.default_card, customer_id: customer.id)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "pay"
      end
    end
  end
  
  def delete
    card = Creditcard.where(user_id: current_user.id).last
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to action: "new"
  end

  def index
    @card = Creditcard.where(user_id: current_user.id).last
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
end
