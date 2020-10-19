class Item < ApplicationRecord
  belongs_to :user
  has_one :trade
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :description, :price
    validates :category_id, :status_id, :ship_charge_id, :ship_region_id, :ship_day_id, numericality: {other_than: 0, message: "Select"}
  end
  validates :price, numericality: { only_integer: true, message: "Half-width number"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
end
