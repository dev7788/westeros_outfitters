require 'rails_helper'

RSpec.describe ChargesController do
  describe "GET new" do
    it "assigns @amount" do
      get :new
      expect((@amount)).to eq(nil)
    end

    it "renders the index template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "charges card" do
      user = User.create!(username: 'aaron', password: 'admin', email: 'packers@example.com', address: '123123', id: 1234)
      user.orders.create!(amount: 100, status: 0, id: 12345)
      @order = user.orders.last
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      post :create
      expect(response).to render_template("layouts/application")
      expect(assigns(@order.status)).to eq(nil)
      expect(@order.save).to eq(true)
    end
  end
end
