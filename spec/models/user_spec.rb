require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:orders) }

  it { should respond_to(:username) }
  it { should respond_to(:password) }
  it { should respond_to(:address) }
  it { should respond_to(:email) }
  it { should respond_to(:role) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:role) }

  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }

  scenario "user is valid only with all attributes" do
    user = User.new(username: "clay", password: "admin")
    user_1 = User.new(username: "aaron", password: "admin", email: "packers@example.com")
    user_2 = User.new(username: "aaron", password: "admin", email: "packers@example.com", address: "123123")

    expect(user.save).to eq false
    expect(user_1.save).to eq false
    expect(user_2.save).to eq true
  end
end
