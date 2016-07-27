require 'pry'

class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(item)
    contents[item.to_s] ||= 0
    contents[item.to_s] += 1
  end

  def items
    contents.map do |item_id,quantity|
     Item.find(item_id)
   end
  end

  def total
    prices=[]
    items.each do |item|
      item= Item.find(item)
      quantity= contents[item.id.to_s]
      prices << item.price * quantity.to_i
    end
    prices.reduce(0,:+)
  end

  def count_of(items)
    items.values.sum
  end




end
