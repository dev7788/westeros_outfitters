class SessionsController < ApplicationController

  def new
    render :layout => false
  end

  def get_dashboard(user)
    if current_admin?
      redirect_to admin_dashboard_path
    else
      redirect_to @user
  end
end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      get_dashboard(@user)
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
