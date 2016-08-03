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
    remove_item(item) if contents[item.to_s] == 0
  end

  def items
    contents.map do |item_id, _count|
      Item.find(item_id)
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
    item.price * quantity(item)
  end

  def quantity(item)
    contents[item.id.to_s]
  end

  def remove_item(item_id)
    contents.delete(item_id.to_s)
  end
end
