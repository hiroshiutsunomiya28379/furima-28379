require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idを選択していないと保存できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it 'status_idを選択していないと保存できないこと' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end

    it 'ship_charge_idを選択していないと保存できないこと' do
      @item.ship_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship charge Select")
    end

    it 'ship_region_idを選択していないと保存できないこと' do
      @item.ship_region_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship region Select")
    end

    it 'ship_day_idを選択しないないと保存できないこと' do
      @item.ship_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day Select")
    end

    it 'priceが空だと保存できいないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが全角数字だと保存できないこと' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it 'priceが300円未満では保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'category_idが空の場合保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'status_idを選択していないと保存できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'ship_charge_idを選択していないと保存できないこと' do
      @item.ship_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship charge can't be blank")
    end

    it 'ship_region_idを選択していないと保存できないこと' do
      @item.ship_region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship region can't be blank")
    end

    it 'ship_day_idを選択しないないと保存できないこと' do
      @item.ship_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day can't be blank")
    end
  end
end
