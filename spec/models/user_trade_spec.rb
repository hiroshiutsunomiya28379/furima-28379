require 'rails_helper'

RSpec.describe UserTrade, type: :model do
  before do
    @user_trade = FactoryBot.build(:user_trade)
  end

  it '全ての値が正しく入力されていれば保存できること' do
    expect(@user_trade).to be_valid
  end

  it '建物名が空でも保存できること' do
    @user_trade.building_name = nil
    expect(@user_trade).to be_valid
  end

  it 'postal_codeが空だと保存できないこと' do
    @user_trade.postal_code = nil
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("Postal code can't be blank")
  end

  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @user_trade.postal_code = '1234567'
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("Postal code Input correctly")
  end

  it 'prefecture_idを選択していないと保存できないこと' do
    @user_trade.prefecture_id = 0
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("Prefecture Select")
  end

  it 'prefecture_idが空の場合保存できないこと' do
    @user_trade.prefecture_id = nil
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'cityが空では保存できないこと' do
    @user_trade.city = nil
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("City can't be blank")
  end

  it 'house_numberが空では保存できないこと' do
    @user_trade.house_number = nil
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("House number can't be blank")
  end

  it 'phone_numberが空では保存できないこと' do
    @user_trade.phone_number = nil
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("Phone number can't be blank")
  end

  it 'phone_numberにハイフンが存在すると保存できないこと' do
    @user_trade.phone_number = '090-1234-5678'
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("Phone number Input only number")
  end

  it 'phone_numberは11桁より多いと保存できない' do
    @user_trade.phone_number = '090123456789'
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  end

  it 'tokenが空では保存できないこと' do
    @user_trade.token = nil
    @user_trade.valid?
    expect(@user_trade.errors.full_messages).to include("Token can't be blank")
  end
end
