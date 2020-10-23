class TradesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @trade = UserTrade.new
  end

  def create
    @trade = UserTrade.new(trade_params)
    @trade.save
  end

  private

  def trade_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :trade_id, :user_id, :item_id)
  end
end
