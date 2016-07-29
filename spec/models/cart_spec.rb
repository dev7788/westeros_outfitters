require 'rails_helper'

RSpec.describe Cart, type: :model do
  it 'should have initial contents' do
    cart = Cart.new({ '1' => 2 })

    expect(cart.contents).to eq({ '1' => 2 })
  end

  it 'should have empty hash as initial contents if no session cart' do
    cart = Cart.new(nil)

    expect(cart.contents).to eq({})
  end

  it 'should be able to add an item to cart' do
    cart = Cart.new({ '1' => 2 })

    cart.add_item(1)
    cart.add_item(2)

    expect(cart.contents).to eq({ '1' => 3, '2' => 1 })
  end

  it 'should be able to subtract an item from cart' do
    cart = Cart.new({ '1' => 3, '2' => 5 })

    cart.subtract_item(1)
    cart.subtract_item(2)

    expect(cart.contents).to eq({ '1' => 2, '2' => 4 })
  end

  it 'should return the total cost of items in cart' do
    Item.create!(name: 'Iron Throne', description: 'Would hurt to sit on', price: 20.00, img: 'image_url')
    Item.create!(name: 'Dire Wolf', description: 'This wolf is in dire need of an owner', price: 10.00, img: 'image_url1')
    Item.create!(name: 'Moon Door', description: 'A long fall comes before a long winter', price: 5.00, img: 'image_url2')

    cart = Cart.new({ '12' => 2, '13' => 1, '14' => 2 })
    expect(cart.total).to eq(60.00)
  end

  it 'should return the total number of items in cart' do
    cart = Cart.new({ '1' => 3, '2' => 1, '3' => 2 })

    expect(cart.count_of(cart.contents)).to eq(6)
  end

  it 'should return the number of a specific item' do
    item = Item.create!(name: 'Steel Throne', description: 'Hurt to sit on', price: 200.00, img: 'image_url3')
    cart = Cart.new({ '15' => 3 })

    expect(cart.quantity(item)).to eq(3)
  end

  it 'should be able to remove an item from cart' do
    cart = Cart.new({ '1' => 3, '2' => 1, '3' => 2 })

    cart.remove_item(1)

    expect(cart.contents).to eq({ '2' => 1, '3' => 2 })
  end

end
