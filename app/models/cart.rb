class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(item)
    contents[item.to_s] ||= 0
    contents[item.to_s] += 1
  end

  def subtract_item(item)
    contents[item.to_s] -= 1 if contents[item.to_s] > 0
  end

  def items
    contents.map do |item, count|
      Item.find(item.id)
    end
  end

  def total
    prices = []
    items.each do |item|
      prices << item_total(item)
    end
    prices.reduce(0, :+)
  end

  def count_of(items)
    items.values.sum
  end

  def item_total(item)
    item.price * quantity(item).to_i
  end

  def quantity(item)
    contents[item]
  end

  def remove_item(item_id)
    contents.delete(item_id.to_s)
  end
end
