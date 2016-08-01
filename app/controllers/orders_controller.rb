class OrdersController < ApplicationController
  before_action :current_user
  before_action :set_orders, only: [:index, :show, :create]

  def index
  end

  def show
    if @orders.find_by(id: params[:id]).nil?
      render file: '/public/404'
    else
      @order = @orders.find(params[:id])
      render :show
    end
  end

  def create
    @order = @orders.create(amount: @cart.total, status: 0)
    @order.add_order_items(@cart)
    redirect_to @order
    session[:cart] = {}
  end

  private

  def set_orders
    @orders = current_user.orders
  end
end
