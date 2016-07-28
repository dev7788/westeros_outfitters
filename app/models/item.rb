class Item < ActiveRecord::Base
  belongs_to :category
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence:true, uniqueness: true
  validates :img, presence:true, uniqueness: true
  validates :price, presence:true
  validates :description, presence:true
end
