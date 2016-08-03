require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:order_items).dependent(:destroy) }
  it { should have_many(:items).through(:order_items) }

  it { should respond_to(:amount) }


  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:user_id) }

  it 'should save when it has all attributes' do
    user = User.create(username: 'aaron', password: 'admin', email: 'packers@example.com', address: '123123')
    order = user.orders.create(amount: 188, user_id: 1)
    order1 = Order.new(amount: 182)

    expect(order.save).to eq true
    expect(order1.save).to eq false
  end
end
