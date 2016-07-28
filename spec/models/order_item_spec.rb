require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  it { should belong_to(:order) }
  it { should belong_to(:item) }

  it { should respond_to(:item_id) }
  it { should respond_to(:order_id) }


  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:item_id) }

  it 'should save when it has all attributes' do
    item = Item.new(name: "Hand of the King Pin", img: "www.fake.com", price: "100", description: "The hand where's this pin", id: 1)
    user = User.create(username: "aaron", password: "admin", email: "packers@example.com", address: "123123")
    order = user.orders.create(amount: 188, user_id: 1)
    order_item = order.order_items.create
    order_item1 = order.order_items.create(item_id: 1)

    expect(order_item.save).to eq false
    expect(order_item1.save).to eq true
  end
end
