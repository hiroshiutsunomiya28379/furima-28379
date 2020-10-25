class TradesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :set_item

  def index
    @user_trade = UserTrade.new
  end

  def create
    @user_trade = UserTrade.new(trade_params)
    
    if @user_trade.valid?
      pay_item
      @user_trade.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def trade_params
    params.require(:user_trade).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: trade_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.trade != nil
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
