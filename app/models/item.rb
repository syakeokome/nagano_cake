class Item < ApplicationRecord
  attachment :image
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
