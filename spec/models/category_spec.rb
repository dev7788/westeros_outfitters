require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:items) }

  it { should respond_to(:name) }

  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:name) }

  scenario 'category is valid only with all attributes' do
    category = Category.new()
    category_1 = Category.new(name: 'aaron')
    category_2 = Category.new(name: 'aaron')

    expect(category.save).to eq false
    expect(category_1.save).to eq true
    expect(category_2.save).to eq false
  end

  scenario 'category can clean name for url path' do
    category_1 = Category.new(name: 'aaron rodgers')

    expect(category_1.slug).to eq 'aaron-rodgers'
  end
end
