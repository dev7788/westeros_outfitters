class Item < ActiveRecord::Base
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence:true, uniqueness: true
  validates :img, presence:true, uniqueness: true
  validates :price, presence:true
  validates :description, presence:true

  def quantity(order_id)
    find_order_items(order_id).quantity
  end

  def subtotal(order_id)
    find_order_items(order_id).subtotal
  end

  def find_order_items(order_id)
    self.order_items.find_by(order_id: order_id)
  end
end
