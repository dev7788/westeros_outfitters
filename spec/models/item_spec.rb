require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:category) }
  it { should have_many(:order_items).dependent(:destroy) }
  it { should have_many(:orders).through(:order_items) }

  it { should respond_to(:name) }
  it { should respond_to(:img) }
  it { should respond_to(:price) }
  it { should respond_to(:description) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:img) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:description) }

  it { should validate_uniqueness_of(:name) }

  it 'should have all attributes' do
    item = Item.new(name: 'Hand of the King Pin', img: 'www.fake.com', price: 100, description: 'The hand wears this pin')

    expect(item.name).to eq('Hand of the King Pin')
    expect(item.img).to eq('www.fake.com')
    expect(item.price).to eq(100.0)
    expect(item.description).to eq('The hand wears this pin')
  end

  it 'should not work if any attributes are missing' do
    item = Item.new(img: 'www.fake.com', price: 100, description: 'The hand wears this pin')

    expect(item.save).to eq false
  end

  it 'should not save if price is not greater than 0' do
    item = Item.new(img: 'www.fake.com', price: 0, description: 'The hand wears this pin')

    expect(item.save).to eq false
  end
end
