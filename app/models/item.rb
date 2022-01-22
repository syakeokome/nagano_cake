class Item < ApplicationRecord
  attachment :image
  has_many :order_details, dependent: :destroy
end
