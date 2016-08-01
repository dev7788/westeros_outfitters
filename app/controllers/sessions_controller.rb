class SessionsController < ApplicationController

  def new
  end

  def get_dashboard(user)
    if current_admin?
      redirect_to admin_dashboard_path
    else
      redirect_to user
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if @cart.items.count == 0
        get_dashboard(user)
      else
        redirect_to cart_path
      end
    else
      flash.now[:error] = "Wrong Username or Password"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Goodbye!"
    redirect_to login_path
  end
end
