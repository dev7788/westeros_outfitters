class Item < ActiveRecord::Base
  belong_to :categories
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
end 
