class Item < ApplicationRecord
  belongs_to :user
  # has_one :orders

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :date_of_shipment

  validates :item_category_id, numericality: { other_than: 1, massage: "can't be blank" }
  validates :item_status_id, numericality: { other_than: 1, massage: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, massage: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, massage: "can't be blank" }
  validates :date_of_shipment_id, numericality: { other_than: 1, massage: "can't be blank" }

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :item_price, presence: true,
                         numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
end
