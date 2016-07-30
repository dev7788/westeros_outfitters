class Admin::UsersController < Admin::BaseController
  before_action :current_user

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      render :edit
    else
      render file: '/public/404'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_dashboard_path
    else
      flash[:error] = 'You need to fill out all fields'
      render :edit
  end
end

  private

  def user_params
    params.require(:user).permit(:username, :password, :address, :email)
  end
end
