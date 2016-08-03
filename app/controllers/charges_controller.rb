class ChargesController < ApplicationController

  def new
<<<<<<< Updated upstream
    @amount = session[:order_amount]
    session[:order_amount] = nil
=======
    @amount = params['amount']
>>>>>>> Stashed changes
  end

  def create
    @order = current_user.orders.find(params[:order_id])
    @amount = @order.amount
<<<<<<< Updated upstream
    session[:order_amount] = @amount
=======
    binding.pry
>>>>>>> Stashed changes

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:    customer.id,
      amount:      @amount,
      description: "Westeros Outfitters Checkout",
      currency:    "usd"
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
<<<<<<< Updated upstream
    redirect_to new_charge_path
    @order.status = 1
    @order.save
=======
    redirect_to new_charge_path(amount: @amount)
>>>>>>> Stashed changes
  end
end
