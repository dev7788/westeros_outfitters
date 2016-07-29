class Item < ActiveRecord::Base
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence:true, uniqueness: true
  validates :img, presence:true, uniqueness: true
  validates :price, presence:true
  validates :description, presence:true

  def quantity(order_id)
    order_item = self.order_items.find_by(order_id: order_id)
    order_item.quantity
  end

  def subtotal(order_id)
    order_item = self.order_items.find_by(order_id: order_id)
    order_item.subtotal
  end
end
