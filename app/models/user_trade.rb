class UserTrade

  include ActiveModel::Model 
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :city, :house_number, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 0, message: "Select"}
    validates :phone_number, numericality: { only_integer: true, message: "Input only number"}
  end
  validates :phone_number, length: { maximum: 11 }

  def save

    trade = Trade.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, trade_id: trade.id)
  end
end