class TradesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @trade = UserTrade.new
  end

  def create
    @trade = UserTrade.new(trade_params)
    if @trade.valid?
      pay_item
      @trade.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def trade_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :trade_id, :user_id, :item_id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: trade_params[:token],
      currency: 'jpy'
    )
  end
end
