class OrdersController < ApplicationController
  before_action :current_user

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  # def new
  #   @order = Order.new
  # end

  def create
    @order = current_user.orders.create(amount: @cart.total, status: 0)
    @order.add_order_items(@cart)
    redirect_to @order
    session[:cart] = {}
  end
end
