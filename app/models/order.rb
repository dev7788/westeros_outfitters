class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :status, presence: true

  enum status: %w(Ordered Paid Cancelled Completed)#, default: 0

  def add_order_items(cart)
    cart.contents.each do |item_id, qty, item_total|
      item = Item.find(item_id)
      self.order_items.create(item_id: item_id, quantity: qty, subtotal: item.price * qty)
    end
  end
end
